{ pkgs, lib, ... }:

{
  programs.git.enable = true;
  programs.git.ignores = [
    "*~"
  ];

  # TODO multiple "insteadOf"
  programs.git.userName = "Kate Follett";

  # Need to override on work machines
  programs.git.userEmail = lib.mkDefault "git@klgf.dev";

  programs.git.iniContent = {
    "push" = {
      default = "simple";
    };
    "merge" = {
      conflictstyle = "diff3";
    };
    "rerere" = {
      enabled = true;
    };
    "url \"ssh://git@gist.github.com\"" = {
      insteadOf = git://gist.github.com;
      "insteadOf " = https://gist.github.com;
      "insteadOf  " = http://gist.github.com;
    };
    "url \"ssh://git@github.com\"" = {
      insteadOf = git://github.com;
      "insteadOf " = https://github.com;
      "insteadOf  " = http://github.com;
    };
    "url \"ssh://git@gitlab.\"" = {
      insteadOf = git://gitlab.;
      "insteadOf " = https://gitlab.;
      "insteadOf  " = http://gitlab.;
    };
    "url \"ssh://git@bitbucket.com\"" = {
      insteadOf = git://bitbucket.com;
      "insteadOf " = https://bitbucket.com;
      "insteadOf  " = http://bitbucket.com;
    };
    "sendemail" = {
      smtpEncryption = "tls";
      smtpServer = "smtp.fastmail.com";
      smtpUser = "mail@klgf.dev";
      smtpServerPort = 587;
    };
  };
  programs.git.package = pkgs.gitFull.override { guiSupport = true; };
}
