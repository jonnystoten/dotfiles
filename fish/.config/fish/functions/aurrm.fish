function aurrm
  set remote_path s3://jonnystoten-arch/repo/x86_64
  set local_path $HOME/.local/share/arch-repo
  set repo_name jonnystoten

  mkdir -p $local_path

  if test -z $flocker
    # Grab an exlusive lock so we don't try running this twice
    # as that could cause packages to be deleted before they're
    # uploaded!
    set self_command fish -c "aur_rm $argv"
    env flocker=1 flock -xn $local_path/aursync.lock $self_command
    return
  end

  # Sync remote db to local
  s3cmd sync $remote_path/$repo_name.{db,files}.tar.xz $local_path/
  ln -sf $repo_name.db.tar.xz $local_path/$repo_name.db
  ln -sf $repo_name.files.tar.xz $local_path/$repo_name.files

  repo-remove $local_path/$repo_name.db.tar.xz $argv

  s3cmd sync --follow-symlinks --acl-public \
    $local_path/$repo_name.{db,files}{,.tar.xz} \
    $remote_path/

  for package in $argv
    s3cmd rm "$remote_path/$package-*.pkg.tar.xz"
  end
end

