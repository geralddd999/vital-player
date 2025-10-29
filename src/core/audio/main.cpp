#include "AudioPlayer.h"
#include <iostream>
#include <thread>
#include <chrono>


int main(int argc, char* argv[]) {

    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <audio_file_1> [audio_file_2] ..." << std::endl;
        return 1;
    }

    // Collect all arguments as tracks
    std::vector<std::string> tracklist;
    for (int i = 1; i < argc; ++i) {
        tracklist.push_back(argv[i]);
    }

    AudioPlayer player;

    if (!player.init()) {
        std::cerr << "Failed to initialize audio player." << std::endl;
        return 1;
    }

    player.setTrackList(tracklist);
    
    if (!player.loadTrack(0)) {
        std::cerr << "Failed to load initial track." << std::endl;
        return 1;
    }
    
    player.play();
    
    std::cout << "--- Audio Player ---" << std::endl;
    std::cout << "Playing: " << player.getCurrentTrackPath() << std::endl;
    std::cout << "Controls:" << std::endl;
    std::cout << "  p : Play/Pause" << std::endl;
    std::cout << "  > : Next Track" << std::endl;
    std::cout << "  < : Previous Track" << std::endl;
    std::cout << "  s : Seek to 10 seconds" << std::endl;
    std::cout << "  q : Quit" << std::endl;

    char input;
    bool running = true;
    while (running) {
        // Non-blocking status update
        if (player.isPlaying()) {
            printf("\rTime: %.2f / %.2f s", player.getCurrentTime(), player.getDuration());
            fflush(stdout);
        } else {
            printf("\r[Paused or Stopped]");
            fflush(stdout);
        }

        // A real app would use SDL_PollEvent for input
        // For this console demo, we'll just check for user input
        // This is a simple/crude way to check console input without blocking
        // A better console app would use ncurses or similar.
        
        // This part is tricky in a cross-platform way.
        // For simplicity, let's just use a blocking std::cin
        // The time display will only update after you press Enter.
        
        // --- For a non-blocking demo, comment out the `std::cin` block
        // --- and uncomment the `std::this_thread::sleep_for` block.
        
        // --- Block 1: Blocking input ---
        std::cout << "\nEnter command (p, >, <, s, q): ";
        std::cin >> input;
        // --- End Block 1 ---

        // --- Block 2: Non-blocking (polling) ---
        // std::this_thread::sleep_for(std::chrono::milliseconds(100));
        // continue; // Just loop and show time
        // --- End Block 2 ---
        
        switch (input) {
            case 'p':
                if (player.isPlaying()) {
                    player.pause();
                    std::cout << "\nPaused." << std::endl;
                } else {
                    player.play();
                    std::cout << "\nPlaying." << std::endl;
                }
                break;
            case '>':
                player.nextTrack();
                std::cout << "\nNext: " << player.getCurrentTrackPath() << std::endl;
                break;
            case '<':
                player.prevTrack();
                std::cout << "\nPrev: " << player.getCurrentTrackPath() << std::endl;
                break;
            case 's':
                std::cout << "\nSeeking to 10s..." << std::endl;
                player.seek(10.0);
                break;
            case 'q':
                running = false;
                std::cout << "\nQuitting." << std::endl;
                break;
            default:
                break;
        }
    }

    return 0;
}
