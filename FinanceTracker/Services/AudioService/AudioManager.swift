import AVFoundation
import Foundation

class AudioManager {
    static var shared = AudioManager()
    private init() {}
    
    func createUrlSound( audioPlayer: inout AVAudioPlayer?) {
        if let soundURL = Bundle.main.url(forResource: SoundUrl.firstSound.rawValue, withExtension: Format.mp3.rawValue) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer!.prepareToPlay()
            } catch {
                print("\(error.localizedDescription)")
            }
        } else {
            print("error")
        }
    }
}
