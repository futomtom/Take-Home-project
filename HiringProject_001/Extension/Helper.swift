import Foundation

extension JSONDecoder {
    static func makeDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}

extension String {
    func urlDecoded() -> String {
        return removingPercentEncoding ?? ""
    }
}

extension Date {
    func formattedTimeUntilNow() -> String {
        let now = Date()
        let different = Calendar.current.dateComponents([.year, .day, .hour, .minute, .second], from: self, to: now)
        if different.year != 0 {
            let differentDay = Calendar.current.dateComponents([.day], from: self, to: now)
            return "\(String(format: "%.1f", floor(Double(10 * differentDay.day!) / 365.0) / 10))y"
        }
        if different.day != 0 {
            return "\(different.day!)d"
        }
        if different.hour != 0 {
            return "\(different.hour!)h"
        }
        if different.minute != 0 {
            return "\(different.minute!)m"
        }
        return "\(different.second ?? 0)s"
    }
}
