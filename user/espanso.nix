{ services, ... }:

{
  services.espanso = {
    enable = true;
    matches = {
      base = {
        matches = [
            {
                trigger = ";gh-check";
                replace = "ssh git@github.com";
            }
            {
                trigger = ";gc";
                replace = "git clone git@github.com:luftkode/$|$.git";
            }
        ];
        
    };
  };
};
}