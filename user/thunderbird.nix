{ pkgs, config, current, ... }:

{
  programs.thunderbird = {
    enable = true;
    profiles.gp = {
      isDefault = true;
    };
  };

  accounts.email = {
    accounts.outlook = {
      realName = "Gregers Poulsen";
      address = "gp@skytem.com";
      userName = "gpo@airborneinstruments.dk";
      primary = true;
      imap = {
        host = "outlook.office365.com";
        port = 993;
      };
      smtp = {
        host = "smtp.office365.com";
        port = 587;
      };
     thunderbird = {
        enable = true;
        profiles = [ "gp" ];
      };
    };
  };
}