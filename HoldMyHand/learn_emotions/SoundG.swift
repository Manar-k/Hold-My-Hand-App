import SwiftUI
import AVKit
//import AVFAudio
import AVFoundation

class SoundG{
    
    @State var audioPlayer: AVAudioPlayer?
    @State var isPlaying : Bool = false
    
    static let instance = SoundG()
    var player: AVAudioPlayer?
    
    func soundemo() {
        if let path = Bundle.main.path(forResource: "emoface", ofType: "wav") {
            
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
    
    
    
    func playSound2(){
        guard let url = Bundle.main.url(forResource: "surprised", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    
    // secend sound 
    func SadSound(){
        guard let url = Bundle.main.url(forResource: "sad", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    func HappySound(){
        guard let url = Bundle.main.url(forResource: "happy", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    
    func AngrySound(){
        guard let url = Bundle.main.url(forResource: "angry", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    func sleepSound(){
        guard let url = Bundle.main.url(forResource: "sleepy", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    
    func clamSound(){
        guard let url = Bundle.main.url(forResource: "calm", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    
    func ShySound(){
        guard let url = Bundle.main.url(forResource: "shy", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    func sickSound(){
        guard let url = Bundle.main.url(forResource: "sick", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    func excitedSound(){
        guard let url = Bundle.main.url(forResource: "excited", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
    
    
    func scaredSound(){
        guard let url = Bundle.main.url(forResource: "frearful", withExtension: "wav") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            
            print("Error.\(error.localizedDescription)")
        }
        
    }
}
