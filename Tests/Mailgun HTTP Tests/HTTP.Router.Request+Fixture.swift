import Byte
import RFC_3986
import RFC_9110

extension RFC_9110.Message.Request where Content == [Byte] {
    var path: RFC_3986.URI.Path? {
        guard case .resource(let uri) = target else { return nil }
        return uri.path
    }

    var query: RFC_3986.URI.Query? {
        guard case .resource(let uri) = target else { return nil }
        return uri.query
    }
}
