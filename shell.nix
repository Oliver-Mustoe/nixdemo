let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs {config = {}; overlays=[]; };
in
  pkgs.mkShellNoCC {
   packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
     flask 
     click
     importlib-metadata
     itsdangerous
     jinja2
     markupsafe
     mysql-connector
     typing-extensions
     zipp
    ]))
    curl
    sqlite-interactive
   ];

   shellHook = ''
     flask run &
   '';
  }
