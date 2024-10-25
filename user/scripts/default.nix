{ pkgs, ... }: 
{
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "miro" "google-chrome-stable --app=https://miro.com/app/dashboard")
  ];
}