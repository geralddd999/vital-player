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
      devShells."${system}".default =
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.mkShell {

          packages = with pkgs; [
            qt6Packages.qtdeclarative
            qt6Packages.qtbase
            qt6Packages.qttools
            qtcreator
            clang-tools
            SDL2
            SDL2_mixer
            ffmpeg
            gcc
            gdb
            valgrind
            cmake
            pkg-config
          ];
          #check later
          shellHook = ''

            export QT_PLUGIN_PATH="${pkgs.qt6Packages.qtbase}/lib/qt-6/plugins"
            export QML_IMPORT_PATH="${pkgs.qt6Packages.qtdeclarative}/qml"

            echo "entered qt/c++ dev session"
          '';
        };
    };

}
