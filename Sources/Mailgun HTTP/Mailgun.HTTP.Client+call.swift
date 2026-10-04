import Foundation
import HTTP
import HTTP_Router
import RFC_9110

extension Mailgun.HTTP.Client {
    /// Builds a wire-request via `build`, sends it, and decodes the JSON
    /// response body as `Response`.
    ///
    /// The single execution primitive every `Mailgun.<Resource>.Client<Failure>`
    /// factory method's closures reduce to (see `Mailgun.HTTP.Client+<Resource>.swift`):
    /// construction failures widen to `.construction`, transport failures to
    /// `.execute` (both via `send(_:)`), and a response body that doesn't
    /// decode as `Response` becomes `.decode`.
    ///
    /// Uses `Foundation.JSONDecoder` for the same reason
    /// `Mailgun.HTTP.Construction.json(_:into:)` uses `Foundation.JSONEncoder`:
    /// the ecosystem's RFC 8259 codec (`swift-json`) pulls in `swift-async`/
    /// `swift-kernel` bindings that fail to compile on this toolchain, a
    /// pre-existing defect out of scope for this repository.
    func call<Response: Swift.Decodable>(
        _ build: () throws(Mailgun.HTTP.Construction.Error) -> HTTP.Router.Request
    ) async throws(Mailgun.HTTP.Error<ExecutionFailure>) -> Response {
        let request: HTTP.Router.Request
        do throws(Mailgun.HTTP.Construction.Error) {
            request = try build()
        } catch {
            throw .construction(error)
        }
        let response = try await self.send(request)
        do {
            return try Foundation.JSONDecoder().decode(
                Response.self,
                from: Foundation.Data((response.content ?? []).map(\.underlying))
            )
        } catch {
            throw .decode(String(describing: error))
        }
    }
}
