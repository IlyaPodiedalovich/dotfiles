function dotfiles-save
    if test (count $argv) -eq 0
        echo "Использование: dotfiles-save 'описание изменения'"
        return 1
    end
    chezmoi add --recursive ~/.config
    chezmoi cd
    git add -A
    git commit -m $argv[1]
    git push
    cd -
end
