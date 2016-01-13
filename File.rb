Dir["/*.txt"]
print File.read("/comics.txt")
#Copy comics.txt to a folder name Home.
FileUtils.cp('/comics.txt', '/Home/comics.txt')
Dir["/Home/*.txt"]
# let's open the file in append mode, which we indicate with the "a" parameter. 
#This will allow us to put new stuff at the end of the file.
File.open ("/Home/comics.txt", "a") do |f|
#..
f << "Cat and Girl: http://catandgirl.com/"
end
print File.read("/Home/comics.txt")
# Check the time was it when we check the file
File.mtime("/Home/comics.txt")
File.mtime("/Home/comics.txt").hour
