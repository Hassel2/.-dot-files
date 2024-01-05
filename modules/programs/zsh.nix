{ ... }:
{
    programs.zsh = {
        enable = true;
        autocd = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        syntaxHighlighting = {
            enable = true;
            highlighters = [
                "main"
                "brackets"
                "cursor"
                "root"
            ];
        };
        prezto = {
            enable = true;
            prompt.theme = "sorin";
        };
    };
}
