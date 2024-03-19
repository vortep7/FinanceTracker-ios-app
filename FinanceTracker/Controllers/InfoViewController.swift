import AVFoundation
import UIKit

class InfoViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    var infoView: InfoView {return self.view as! InfoView}
    var playing = false
    var shared = AVAudioSession.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoView.onFirstActionButon = {[weak self] in self!.playOrStopMusic()}
        configSound()
        
        do {
            try AudioManager.shared.createUrlSound { result in
                self.audioPlayer = result
            }
        } catch {
        }
    }
    
    override func loadView() {
        self.view = InfoView(frame: UIScreen.main.bounds)
    }
}

extension InfoViewController {
    @objc func playOrStopMusic() {
        if audioPlayer!.isPlaying {
            audioPlayer?.pause()
        } else {
            audioPlayer?.play()
        }
    }
    
    func configSound() {
        do {
            try shared.setCategory(.playback)
            try shared.setActive(true)
        } catch {
            print("\(error.localizedDescription)")
        }
    }

}

enum SoundUrl: String {
    case firstSound = "Evgeniy Ponasenkov - I Love Paris"
}

enum Format: String {
    case mp3 = "mp3"
}
