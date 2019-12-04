# from this dir:
for file in ~/dotfiles/*; do
    filename=$(echo "$file" | awk -F "/" '{print $NF}')
    stow $filename
done
