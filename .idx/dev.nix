{pkgs}: {
  channel = "stable-24.05";
  packages = with pkgs; [
    nodejs_20
    firebase-tools
    jq
    yarn
  ];
  idx.extensions = [
    "firebase.firebase-vscode"
  ];
  idx.previews = {
    previews = {
      web = {
        command = [
          "npm"
          "run"
          "dev"
          "--"
          "--port"
          "$PORT"  # Fixed: Use the environment variable
          "--hostname"
          "0.0.0.0"
        ];
        manager = "web";
      };
      firebase = {
        command = [
          "firebase"
          "emulators:start"
          "--project"
          "open-lovable-f47cb"
        ];
        manager = "web";
      };
    };
  };
}
