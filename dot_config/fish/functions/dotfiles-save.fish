function dotfiles-save
    if test (count $argv) -eq 0
        echo "Использование: dotfiles-save 'описание изменения'"
        return 1
    end
    chezmoi re-add
    cd ~/.local/share/chezmoi
    git add -A
    git commit -m $argv[1]
    git push
    cd -
end
