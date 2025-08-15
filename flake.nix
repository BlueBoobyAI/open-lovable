{
  description = "PromptWeaver Lite Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nodejs_20
            firebase-tools
            jq
            yarn
            git  # Add git if you need it
          ];
          
          # Set environment variables if needed
          FIREBASE_PROJECT = "open-lovable-f47cb";
        };
      }
    );
}
