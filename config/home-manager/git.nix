{
  programs.git = {
    enable = true;
    userName = "Philipp Mandler";
    userEmail = "info@philipp-mandler.com";
    aliases = {
      lol = "log --graph --decorate --pretty=oneline --abbrev-commit --all";

      # Get the current branch name (not so useful in itself, but used in
      # other aliases)
      branch-name = "!git rev-parse --abbrev-ref HEAD";

      # Push the current branch to the remote "origin", and set it to track
      # the upstream branch
      publish = "!git push -u origin $(git branch-name)";

      # Delete the remote version of the current branch
      unpublish = "!git push origin :$(git branch-name)";
    };

    extraConfig = {
      core = {
        hooksPath = "~/.githooks";
        ignorecase = "false";
      };

      pull = {
        rebase = false;
      };

      "merge \"npm-merge-driver\"" = {
        name = "automatically merge npm lockfiles";
        driver = "npx npm-merge-driver merge %A %O %B %P";
      };
    };
  };
}
