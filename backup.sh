#!/bin/bash
movies="/home/tom/Movies"
music="/home/tom/Music"
tv_show="/home/tom/TV_Shows"

movies_backup="/home/tom/Movies_Backup"
tv_music_backup="/home/tom/TV_Shows_Music_Backup"

rsync_options="--inplace --append --partial --progress --stats --delete-delay -r"

rm $movies/movies.txt
rm $tv_show/tvshows.txt
rm $music/music.txt

rm $movies_backup/movies.txt
rm $tv_music_backup/TV_Shows/tvshows.txt
rm $tv_music_backup/Music/music.txt

rsync $rsync_options $movies/ $movies_backup
rsync $rsync_options $tv_show/ $tv_music_backup/TV_Shows
rsync $rsync_options $music/ $tv_music_backup/Music

cd $movies
ls -R > movies.txt
cd $movies_backup
ls -R > movies.txt
diff $movies/movies.txt $movies_backup/movies.txt

cd $tv_show
ls -R > tvshows.txt
cd $tv_music_backup/TV_Shows
ls -R > tvshows.txt
diff $tv_show/tvshows.txt $tv_music_backup/TV_Shows/tvshows.txt

cd $music
ls -R > music.txt
cd $tv_music_backup/Music
ls -R > music.txt
diff $music/music.txt $tv_music_backup/Music/music.txt
