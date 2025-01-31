{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        # Use window manager's recommended size
        dimensions = {
          columns = 0;
          lines = 0;
        };

        padding = {
          x = 6;
          y = 4;
        };

        # Spread additional padding evenly around the terminal content.
        dynamic_padding = true;

        # Allow terminal applications to change Alacritty's window title.
        dynamic_title = true;
      };

      scrolling = {
        multiplier = 3;
      };

      # Font configuration
      font = {
        # Normal (roman) font face
        normal = {
          family = "MesloLGS NF";
          style = "Regular";
        };

        # Bold font face
        bold = {
          family = "MesloLGS NF";

          # The `style` can be specified to pick a specific face.
          style = "Bold";
        };

        # Italic font face
        italic = {
          family = "MesloLGS NF";
          style = "Italic";
        };

        # Point size
        size = 14.0;

        offset = {
          y = 3; # increase line height
        };
      };

      # Colors (Gruvbox dark)
      colors = {
        # Default colors
        primary = {
          # hard contrast: background = '0x1d2021'
          background = "0x282828";
          # soft contrast: background = '0x32302f'
          foreground = "0xebdbb2";
        };

        # Normal colors
        normal = {
          black =   "0x282828";
          red =     "0xcc241d";
          green =   "0x98971a";
          yellow =  "0xd79921";
          blue =    "0x458588";
          magenta = "0xb16286";
          cyan =    "0x689d6a";
          white =   "0xa89984";
        };

        # Bright colors
        bright = {
          black =   "0x928374";
          red =     "0xfb4934";
          green =   "0xb8bb26";
          yellow =  "0xfabd2f";
          blue =    "0x83a598";
          magenta = "0xd3869b";
          cyan =    "0x8ec07c";
          white =   "0xebdbb2";
        };
      };

      # Bell
      bell = {
        animation = "EaseOutExpo";
        duration = 100;
        color = "#999999";
      };

      # Regex hints
      #
      # Terminal hints can be used to find text in the visible part of the terminal
      # and pipe it to other applications.
      hints = {
        # Keys used for the hint labels.
        #alphabet: "jfkdls;ahgurieowpq"

        # List with all available hints
        #
        # Each hint must have a `regex` and either an `action` or a `command` field.
        # The fields `mouse`, `binding` and `post_processing` are optional.
        #
        # The fields `command`, `binding.key`, `binding.mods`, `binding.mode` and
        # `mouse.mods` accept the same values as they do in the `key_bindings` section.
        #
        # The `mouse.enabled` field controls if the hint should be underlined while
        # the mouse with all `mouse.mods` keys held or the vi mode cursor is above it.
        #
        # If the `post_processing` field is set to `true`, heuristics will be used to
        # shorten the match if there are characters likely not to be part of the hint
        # (e.g. a trailing `.`). This is most useful for URIs.
        #
        # Values for `action`:
        #   - Copy
        #       Copy the hint's text to the clipboard.
        #   - Paste
        #       Paste the hint's text to the terminal or search.
        #   - Select
        #       Select the hint's text.
        #   - MoveViModeCursor
        #       Move the vi mode cursor to the beginning of the hint.
        enabled = [
          {
            regex = "(ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)[^\\u0000-\\u001F\\u007F-\\u009F<>\"\\\\s{-}\\\\^⟨⟩`]+";
            command = "open";
            post_processing = true;
            mouse = {
              enabled = true;
              mods = "None";
            };
            binding = {
              key = "U";
              mods = "Control|Shift";
            };
          }
        ];
      };

      mouse = {
        # If this is `true`, the cursor is temporarily hidden when typing.
        hide_when_typing = true;

        # Mouse bindings
        #
        # Available fields:
        #   - mouse
        #   - action
        #   - mods (optional)
        #
        # Values for `mouse`:
        #   - Middle
        #   - Left
        #   - Right
        #   - Numeric identifier such as `5`
        #
        # All available `mods` and `action` values are documented in the key binding
        # section.
        bindings = [
          { mouse = "Middle"; action = "PasteSelection"; }
        ];
      };

      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>";

        # When set to `true`, selected text will be copied to the primary clipboard.
        save_to_clipboard = false;
      };

      cursor = {
        # Cursor style
        #
        # Values for `style`:
        #   - ▇ Block
        #   - _ Underline
        #   - | Beam
        style = "Block";

        # If this is `true`, the cursor will be rendered as a hollow box when the
        # window is not focused.
        unfocused_hollow = true;
      };

      # Live config reload (changes require restart)
      live_config_reload = true;

      # Shell
      #
      # You can set `shell.program` to the path of your favorite shell, e.g. `/bin/fish`.
      # Entries in `shell.args` are passed unmodified as arguments to the shell.
      #
      # Default:
      #   - (macOS) /bin/bash --login
      #   - (Linux) user login shell
      #   - (Windows) powershell
      shell = {
        program = "zsh";
        args = [
          "--login"
          "-c"
          "tmux -u new-session -A -s 0-main"
        ];
      };

      # Key bindings
      #
      # Key bindings are specified as a list of objects. Each binding will specify a
      # key and modifiers required to trigger it, terminal modes where the binding is
      # applicable, and what should be done when the key binding fires. It can either
      # send a byte sequence to the running application (`chars`), execute a
      # predefined action (`action`) or fork and execute a specified command plus
      # arguments (`command`).
      #
      # Bindings are always filled by default, but will be replaced when a new binding
      # with the same triggers is defined. To unset a default binding, it can be
      # mapped to the `None` action.
      #
      # Example:
      #   `- { key: V, mods: Control|Shift, action: Paste }`
      #
      # Available fields:
      #   - key
      #   - mods (optional)
      #   - chars | action | command (exactly one required)
      #   - mode (optional)
      #
      # Values for `key`:
      #   - `A` -> `Z`
      #   - `F1` -> `F12`
      #   - `Key1` -> `Key0`
      #
      #   A full list with available key codes can be found here:
      #   https://docs.rs/glutin/*/glutin/enum.VirtualKeyCode.html#variants
      #
      #   Instead of using the name of the keys, the `key` field also supports using
      #   the scancode of the desired key. Scancodes have to be specified as a
      #   decimal number.
      #   This command will allow you to display the hex scancodes for certain keys:
      #     `showkey --scancodes`
      #
      # Values for `mods`:
      #   - Command
      #   - Control
      #   - Option
      #   - Super
      #   - Shift
      #   - Alt
      #
      #   Multiple `mods` can be combined using `|` like this: `mods: Control|Shift`.
      #   Whitespace and capitalization is relevant and must match the example.
      #
      # Values for `chars`:
      #   The `chars` field writes the specified string to the terminal. This makes
      #   it possible to pass escape sequences.
      #   To find escape codes for bindings like `PageUp` ("\x1b[5~"), you can run
      #   the command `showkey -a` outside of tmux.
      #   Note that applications use terminfo to map escape sequences back to
      #   keys. It is therefore required to update the terminfo when
      #   changing an escape sequence.
      #
      # Values for `action`:
      #   - Paste
      #   - PasteSelection
      #   - Copy
      #   - IncreaseFontSize
      #   - DecreaseFontSize
      #   - ResetFontSize
      #   - ScrollPageUp
      #   - ScrollPageDown
      #   - ScrollLineUp
      #   - ScrollLineDown
      #   - ScrollToTop
      #   - ScrollToBottom
      #   - ClearHistory
      #   - Hide
      #   - Quit
      #   - ClearLogNotice
      #   - SpawnNewInstance
      #   - ToggleFullscreen
      #   - None
      #
      # Values for `action` (macOS only):
      #   - ToggleSimpleFullscreen: Enters fullscreen without occupying another space
      #
      # Values for `command`:
      #   The `command` field must be a map containing a `program` string and
      #   an `args` array of command line parameter strings.
      #
      #   Example:
      #       `command: { program: "alacritty", args: ["-e", "vttest"] }`
      #
      # Values for `mode`:
      #   - ~AppCursor
      #   - AppCursor
      #   - ~AppKeypad
      #   - AppKeypad
      keyboard = {
        bindings = [
          # (Windows/Linux only)
          #{ key = "V";            mods = "Control|Shift";    action = "Paste";            }
          #{ key = "C";            mods = "Control|Shift";    action = "Copy";             }
          #{ key = "Insert";       mods = "Shift";            action = "PasteSelection";   }
          #{ key = "Key0";         mods = "Control";          action = "ResetFontSize";    }
          #{ key = "Equals";       mods = "Control";          action = "IncreaseFontSize"; }
          #{ key = "Add";          mods = "Control";          action = "IncreaseFontSize"; }
          #{ key = "Subtract";     mods = "Control";          action = "DecreaseFontSize"; }
          #{ key = "Minus";        mods = "Control";          action = "DecreaseFontSize"; }
          #{ key = "Return";       mods = "Alt";              action = "ToggleFullscreen"; }

          # (macOS only)
          #{ key = "Key0";         mods = "Command";          action = "ResetFontSize";    }
          #{ key = "Equals";       mods = "Command";          action = "IncreaseFontSize"; }
          #{ key = "Add";          mods = "Command";          action = "IncreaseFontSize"; }
          #{ key = "Minus";        mods = "Command";          action = "DecreaseFontSize"; }
          #{ key = "K";            mods = "Command";          action = "ClearHistory";     }
          #{ key = "K";            mods = "Command";          chars = "\\u000c";             }
          #{ key = "V";            mods = "Command";          action = "Paste";            }
          #{ key = "C";            mods = "Command";          action = "Copy";             }
          { key = "H";            mods = "Command";         action = "Hide";              }
          { key = "Q";            mods = "Command";         action = "Quit";              }
          { key = "W";            mods = "Command";         action = "Quit";              }
          { key = "F";            mods = "Command|Control"; action = "ToggleFullscreen";  }

          { key = "N";            mods = "Command";         action = "SpawnNewInstance";  }


          { key = "Paste";                            action = "Paste";                                 }
          { key = "Copy";                             action = "Copy";                                  }
          { key = "L";            mods = "Control";   action = "ClearLogNotice";                        }
          { key = "L";            mods = "Control";   chars = "\\u000c";                                  }
          { key = "Home";         mods = "Alt";       chars = "\\u001b[1;3H";                             }
          { key = "Home";                             chars = "\\u001bOH";          mode = "AppCursor";   }
          { key = "Home";                             chars = "\\u001b[H";          mode = "~AppCursor";  }
          { key = "End";          mods = "Alt";       chars = "\\u001b[1;3F";                             }
          { key = "End";                              chars = "\\u001bOF";          mode = "AppCursor";   }
          { key = "End";                              chars = "\\u001b[F";          mode = "~AppCursor";  }
          { key = "PageUp";       mods = "Shift";     action = "ScrollPageUp";    mode = "~Alt";        }
          { key = "PageUp";       mods = "Shift";     chars = "\\u001b[5;2~";       mode = "Alt";         }
          { key = "PageUp";       mods = "Control";   chars = "\\u001b[5;5~";                             }
          { key = "PageUp";       mods = "Alt";       chars = "\\u001b[5;3~";                             }
          { key = "PageUp";                           chars = "\\u001b[5~";                               }
          { key = "PageDown";     mods = "Shift";     action = "ScrollPageDown";  mode = "~Alt";        }
          { key = "PageDown";     mods = "Shift";     chars = "\\u001b[6;2~";       mode = "Alt";         }
          { key = "PageDown";     mods = "Control";   chars = "\\u001b[6;5~";                             }
          { key = "PageDown";     mods = "Alt";       chars = "\\u001b[6;3~";                             }
          { key = "PageDown";                         chars = "\\u001b[6~";                               }
          { key = "Tab";          mods = "Shift";     chars = "\\u001b[Z";                                }
          { key = "Back";                             chars = "\\u007f";                                  }
          { key = "Back";         mods = "Alt";       chars = "\\u001b\\u007f";                             }
          { key = "Insert";                           chars = "\\u001b[2~";                               }
          { key = "Delete";                           chars = "\\u001b[3~";                               }
          { key = "Left";         mods = "Shift";     chars = "\\u001b[1;2D";                             }
          { key = "Left";         mods = "Control";   chars = "\\u001b[1;5D";                             }
          { key = "Left";         mods = "Alt";       chars = "\\u001b[1;3D";                             }
          { key = "Left";                             chars = "\\u001b[D";          mode = "~AppCursor";  }
          { key = "Left";                             chars = "\\u001bOD";          mode = "AppCursor";   }
          { key = "Right";        mods = "Shift";     chars = "\\u001b[1;2C";                             }
          { key = "Right";        mods = "Control";   chars = "\\u001b[1;5C";                             }
          { key = "Right";        mods = "Alt";       chars = "\\u001b[1;3C";                             }
          { key = "Right";                            chars = "\\u001b[C";          mode = "~AppCursor";  }
          { key = "Right";                            chars = "\\u001bOC";          mode = "AppCursor";   }
          { key = "Up";           mods = "Shift";     chars = "\\u001b[1;2A";                             }
          { key = "Up";           mods = "Control";   chars = "\\u001b[1;5A";                             }
          { key = "Up";           mods = "Alt";       chars = "\\u001b[1;3A";                             }
          { key = "Up";                               chars = "\\u001b[A";          mode = "~AppCursor";  }
          { key = "Up";                               chars = "\\u001bOA";          mode = "AppCursor";   }
          { key = "Down";         mods = "Shift";     chars = "\\u001b[1;2B";                             }
          { key = "Down";         mods = "Control";   chars = "\\u001b[1;5B";                             }
          { key = "Down";         mods = "Alt";       chars = "\\u001b[1;3B";                             }
          { key = "Down";                             chars = "\\u001b[B";          mode = "~AppCursor";  }
          { key = "Down";                             chars = "\\u001bOB";          mode = "AppCursor";   }
          { key = "F1";                               chars = "\\u001bOP";                                }
          { key = "F2";                               chars = "\\u001bOQ";                                }
          { key = "F3";                               chars = "\\u001bOR";                                }
          { key = "F4";                               chars = "\\u001bOS";                                }
          { key = "F5";                               chars = "\\u001b[15~";                              }
          { key = "F6";                               chars = "\\u001b[17~";                              }
          { key = "F7";                               chars = "\\u001b[18~";                              }
          { key = "F8";                               chars = "\\u001b[19~";                              }
          { key = "F9";                               chars = "\\u001b[20~";                              }
          { key = "F10";                              chars = "\\u001b[21~";                              }
          { key = "F11";                              chars = "\\u001b[23~";                              }
          { key = "F12";                              chars = "\\u001b[24~";                              }
          { key = "F1";           mods = "Shift";     chars = "\\u001b[1;2P";                             }
          { key = "F2";           mods = "Shift";     chars = "\\u001b[1;2Q";                             }
          { key = "F3";           mods = "Shift";     chars = "\\u001b[1;2R";                             }
          { key = "F4";           mods = "Shift";     chars = "\\u001b[1;2S";                             }
          { key = "F5";           mods = "Shift";     chars = "\\u001b[15;2~";                            }
          { key = "F6";           mods = "Shift";     chars = "\\u001b[17;2~";                            }
          { key = "F7";           mods = "Shift";     chars = "\\u001b[18;2~";                            }
          { key = "F8";           mods = "Shift";     chars = "\\u001b[19;2~";                            }
          { key = "F9";           mods = "Shift";     chars = "\\u001b[20;2~";                            }
          { key = "F10";          mods = "Shift";     chars = "\\u001b[21;2~";                            }
          { key = "F11";          mods = "Shift";     chars = "\\u001b[23;2~";                            }
          { key = "F12";          mods = "Shift";     chars = "\\u001b[24;2~";                            }
          { key = "F1";           mods = "Control";   chars = "\\u001b[1;5P";                             }
          { key = "F2";           mods = "Control";   chars = "\\u001b[1;5Q";                             }
          { key = "F3";           mods = "Control";   chars = "\\u001b[1;5R";                             }
          { key = "F4";           mods = "Control";   chars = "\\u001b[1;5S";                             }
          { key = "F5";           mods = "Control";   chars = "\\u001b[15;5~";                            }
          { key = "F6";           mods = "Control";   chars = "\\u001b[17;5~";                            }
          { key = "F7";           mods = "Control";   chars = "\\u001b[18;5~";                            }
          { key = "F8";           mods = "Control";   chars = "\\u001b[19;5~";                            }
          { key = "F9";           mods = "Control";   chars = "\\u001b[20;5~";                            }
          { key = "F10";          mods = "Control";   chars = "\\u001b[21;5~";                            }
          { key = "F11";          mods = "Control";   chars = "\\u001b[23;5~";                            }
          { key = "F12";          mods = "Control";   chars = "\\u001b[24;5~";                            }
          { key = "F1";           mods = "Alt";       chars = "\\u001b[1;6P";                             }
          { key = "F2";           mods = "Alt";       chars = "\\u001b[1;6Q";                             }
          { key = "F3";           mods = "Alt";       chars = "\\u001b[1;6R";                             }
          { key = "F4";           mods = "Alt";       chars = "\\u001b[1;6S";                             }
          { key = "F5";           mods = "Alt";       chars = "\\u001b[15;6~";                            }
          { key = "F6";           mods = "Alt";       chars = "\\u001b[17;6~";                            }
          { key = "F7";           mods = "Alt";       chars = "\\u001b[18;6~";                            }
          { key = "F8";           mods = "Alt";       chars = "\\u001b[19;6~";                            }
          { key = "F9";           mods = "Alt";       chars = "\\u001b[20;6~";                            }
          { key = "F10";          mods = "Alt";       chars = "\\u001b[21;6~";                            }
          { key = "F11";          mods = "Alt";       chars = "\\u001b[23;6~";                            }
          { key = "F12";          mods = "Alt";       chars = "\\u001b[24;6~";                            }
          { key = "F1";           mods = "Super";     chars = "\\u001b[1;3P";                             }
          { key = "F2";           mods = "Super";     chars = "\\u001b[1;3Q";                             }
          { key = "F3";           mods = "Super";     chars = "\\u001b[1;3R";                             }
          { key = "F4";           mods = "Super";     chars = "\\u001b[1;3S";                             }
          { key = "F5";           mods = "Super";     chars = "\\u001b[15;3~";                            }
          { key = "F6";           mods = "Super";     chars = "\\u001b[17;3~";                            }
          { key = "F7";           mods = "Super";     chars = "\\u001b[18;3~";                            }
          { key = "F8";           mods = "Super";     chars = "\\u001b[19;3~";                            }
          { key = "F9";           mods = "Super";     chars = "\\u001b[20;3~";                            }
          { key = "F10";          mods = "Super";     chars = "\\u001b[21;3~";                            }
          { key = "F11";          mods = "Super";     chars = "\\u001b[23;3~";                            }
          { key = "F12";          mods = "Super";     chars = "\\u001b[24;3~";                            }
          { key = "NumpadEnter";                      chars = "\\n";                                    }
        ];
      };
    };
  };
}
