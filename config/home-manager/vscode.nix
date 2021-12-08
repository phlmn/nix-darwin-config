{
  programs.vscode = {
    enable = true;
    userSettings = {
      # Visuals
      "workbench.colorTheme" = "One Dark Pro";
      "workbench.iconTheme" = "seti";

      # Language specific settings
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[json]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[graphql]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[markdown]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      # Generally ignored files (e.g. are not displayed in the explorer)
      "files.exclude" = {
        "**/.classpath" = true;
        "**/.factorypath" = true;
        "**/.idea" = true;
        "**/.project" = true;
        "**/.settings" = true;
      };

      # Files excluded from search
      "search.exclude" = {
        "**/.cache" = true;
        "**/.next" = true;
        "**/dist" = true;
        "**/node_modules" = true;
        "**/target" = true;
      };

      # Misc
      "terminal.integrated.scrollback" = 20000;
      "markdown-preview-enhanced.breakOnSingleNewLine" = false;
    };

    keybindings = [
      {
          "key" = "cmd+[IntlBackslash]";
          "command" = "workbench.action.terminal.toggleTerminal";
      }
      {
          "key" = "ctrl+[Period]";
          "command" = "editor.action.marker.next";
          "when" = "editorFocus";
      }
      {
          "key" = "cmd+k n";
          "command" = "-editor.action.marker.next";
          "when" = "editorFocus";
      }
      {
          "key" = "ctrl+shift+[Period]";
          "command" = "editor.action.marker.prev";
          "when" = "editorFocus";
      }
      {
          "key" = "cmd+k p";
          "command" = "-editor.action.marker.prev";
          "when" = "editorFocus";
      }
      {
          "key" = "cmd+0";
          "command" = "-workbench.action.focusSideBar";
      }
      {
          "key" = "cmd+0";
          "command" = "workbench.action.focusSideBar";
          "when" = "editorFocus";
      }
      {
          "key" = "cmd+0";
          "command" = "workbench.action.focusActiveEditorGroup";
          "when" = "!editorFocus";
      }
      {
          "key" = "ctrl+alt+down";
          "command" = "markdown.extension.onMoveLineDown";
          "when" = "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId == 'markdown'";
      }
      {
          "key" = "alt+down";
          "command" = "-markdown.extension.onMoveLineDown";
          "when" = "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId == 'markdown'";
      }
      {
          "key" = "ctrl+alt+up";
          "command" = "markdown.extension.onMoveLineUp";
          "when" = "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId == 'markdown'";
      }
      {
          "key" = "alt+up";
          "command" = "-markdown.extension.onMoveLineUp";
          "when" = "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId == 'markdown'";
      }
    ];
  };
}
