let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/72da83d9515b43550436891f538ff41d68eecc7f.tar.gz";
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
     flask run
   '';
  }
