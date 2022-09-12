import SwiftUI
import AVKit
import AVFoundation



class Sound{
    
    @State var audioPlayer: AVAudioPlayer?
    @State var isPlaying : Bool = false
    
    
    static let instance = Sound()
    var player: AVAudioPlayer?
    
    
    func playSound2(){
        guard let url = Bundle.main.url(forResource: "surprisedB", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    func soundemo() {
        if let path = Bundle.main.path(forResource: "emofaceB", ofType: "wav") {
            
            self.audioPlayer = AVAudioPlayer()
            
            self.isPlaying.toggle()
            
            let url = URL(fileURLWithPath: path)
            
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                self.audioPlayer?.prepareToPlay()
                self.audioPlayer?.play()
            }catch {
                print("Error")
            }
        }
    }
    
    
    
    
    
    
    
    // secend sound 
    func SadSound(){
        guard let url = Bundle.main.url(forResource: "Sad", withExtension: "mp3") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    func HappySound(){
        guard let url = Bundle.main.url(forResource: "happyB", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    
    func AngrySound(){
        guard let url = Bundle.main.url(forResource: "angryB", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    func sleepSound(){
        guard let url = Bundle.main.url(forResource: "sleepyB-1", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    
    func clamSound(){
        guard let url = Bundle.main.url(forResource: "clamB", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    
    func ShySound(){
        guard let url = Bundle.main.url(forResource: "shyB", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    func sickSound(){
        guard let url = Bundle.main.url(forResource: "sickB", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    func excitedSound(){
        guard let url = Bundle.main.url(forResource: "excitedB", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    func scaredSound(){
        guard let url = Bundle.main.url(forResource: "fearfulB", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
}
//import AVFAudio
