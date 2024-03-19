import AVFoundation
import Foundation

protocol AudioService {
    func createUrlSound(completion: @escaping (AVAudioPlayer) -> Void) throws
}

class AudioManager:AudioService {
    static var shared = AudioManager()
    private init() {}
    
    func createUrlSound(completion: @escaping (AVAudioPlayer) -> Void) throws{
        if let soundURL = Bundle.main.url(forResource: SoundUrl.firstSound.rawValue, withExtension: Format.mp3.rawValue) {
            do {
                let audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer.prepareToPlay()
                completion(audioPlayer)
            } catch {
                throw AudioErrors.badData
            }
        } else {
            throw AudioErrors.invalidUrl
        }
    }
}

