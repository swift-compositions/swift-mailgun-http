import Domain_Standard
import EmailAddress_Standard
import RFC_6531
import Testing
import Time

@testable import Mailgun_HTTP

extension Mailgun.HTTP.Reporting.Events {
    @Suite struct Construction {
        @Suite struct Unit {}
    }
}

extension Mailgun.HTTP.Reporting.Events.Construction.Unit {
    @Test func `list builds the corpus list.full request`() throws {
        let request = try Mailgun.HTTP.Reporting.Events.list(
            try Domain("parity.example.com"),
            .init(
                begin: Time.Instant(secondsSinceUnixEpoch: 1_700_000_000),
                end: Time.Instant(secondsSinceUnixEpoch: 1_700_086_400),
                ascending: .yes,
                limit: 100,
                event: .delivered,
                list: "subscribers@parity.example.com",
                attachment: "report.pdf",
                from: EmailAddress(rfc6531: try RFC_6531.Mailbox("sender@parity.example.com")),
                messageId: "20231113000000.1.PARITYFIXTURE@parity.example.com",
                subject: "Parity fixture subject",
                to: EmailAddress(rfc6531: try RFC_6531.Mailbox("to@parity.example.com")),
                size: 2048,
                recipient: EmailAddress(rfc6531: try RFC_6531.Mailbox("recipient@parity.example.com")),
                recipients: [
                    EmailAddress(rfc6531: try RFC_6531.Mailbox("first@parity.example.com")),
                    EmailAddress(rfc6531: try RFC_6531.Mailbox("second@parity.example.com")),
                ],
                tags: ["newsletter", "onboarding"],
                severity: .permanent
            )
        )
        Corpus.load("Reporting.Events", case: "list.full").expect(matches: request)
    }

    @Test func `list with no query builds the corpus list.bare request`() throws {
        let request = try Mailgun.HTTP.Reporting.Events.list(try Domain("parity.example.com"))
        Corpus.load("Reporting.Events", case: "list.bare").expect(matches: request)
    }
}
