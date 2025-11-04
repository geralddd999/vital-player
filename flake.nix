{

  description = "Nix-flake based Qt/C++ with ffmpeg and SDL dev envrionment";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      devshells."${system}".default =
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.mkShell {

          packages = with pkgs; [
            qt6.full
            qt6.declarative
            qt6.qtbase
            SDL2
            SDL2_mixer
            ffmpeg
            gcc
            gdb
            valgrind
            cmake
            pkg-config
          ];

          shellHook = ''
            echo "entered qt/c++ dev session"

          '';
        };
    };

}
