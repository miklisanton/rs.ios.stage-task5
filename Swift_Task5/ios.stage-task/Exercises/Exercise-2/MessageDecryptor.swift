import UIKit

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ originalMessage: String) -> String {
        print(originalMessage.count)
        var message = originalMessage
        var decryptedMessage = ""
        var messageBefore = ""
        while messageBefore != message {
            decryptedMessage = ""
            var omit = 0
            var index = 0
            messageBefore = message
            while index < message.count {
                if message[index].isNumber {
                    var multiplier = Int(String(message[index]))
                    index += 2
                    let startIndex = index
                    omit = 0
                    if multiplier == 0 {
                        return ""
                    }
                    while multiplier != 0{
                        if message[index] == "]" && omit == 0 {
                            multiplier! -= 1
                            if multiplier == 0 {
                                break
                            }
                            index = startIndex
                        }
                        if message[index].isNumber {
                            omit += 1
                        }
                        if message[index] == "]" {
                            omit -= 1
                        }
                        decryptedMessage += String(message[index])
                        index += 1
                        if index == message.count {
                            return ""
                        }
                    }
                }
                if message[index] != "]" && message[index] != "["{
                    decryptedMessage += String(message[index])
                }
                index += 1
            }
            message = decryptedMessage
        }
        return decryptedMessage
    }
}
