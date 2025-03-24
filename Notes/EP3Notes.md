# EP3 "Our Boy Is Back" Notes

## First run through
1. Searched for the `&`, the `<` and `>` signs 
1. Removed the extra blank lines
1. Any censored had an * so I seperated those out `(\w\*\w+)` and replaced with `<censored>\1</censored>`
1. All crime term words `(\b(DNA|evidence|crime scene|suspect|forensic|detective|homicide|murder|r\*pe|k\*ll)\b)` and replaced with `<crime_term>$1</crime_term>`
1. Question words `(.+\?)` and replaced with `<question>$1</question>`
1. Some lines started with a hyphen so I seperated those lines out with `(^-.*$)` and replacing with `<hyphen>\1</hyphen>`
1. Random is slashes so I tagged them `((?<!<[^>]*)\/)` replaced `<slash>\1</slash>`
1. Repeating be quite `(\bBe quite\b)` replaced `<beQuite>\1</beQuite>`
1. Repeating quite `(\bQuite\b)` replacing `<Quite>\1</Quite>`
1. Sectioned the music out
1. Tagged the title 
1. Tagged the author 
1. Tagged the lyrics seperately
1. I wrappped everyline in a line tag using `(^(.*)$)` and replacing with `<line>\1</line>` making sure that dot matches all is clicked off

1. After pushing the text file to a xml file I added a root element
1. Tagged names
1. Tagged swear words
1. Added more to the crime terms tag that the regex may have missed with words I did not think to add
1. Tagged descriptions/appearances of people
1. Tagged these that could be evidence like DNA, or prints


### Would like to update add too

1. attributes of who each person is (like there title or ranking in the show)
1. tag the places
1. resection the way the lines transcripted and make it more like how they are spoken in the show
1. after fixing the lines tag each section with who is speaking
1. after that tag the setting(s)
1. find any unnoticed missed patterns after just reading.
1. get a break down of each big character in the episodes being covered in a meta data section or on the website


## Second run through changes:
1. removed the line tags
1. removed the hypen and question attributes when removing line tags
1. removed the be quite, quite, and the random slashes tags
1. removed all the description tags
1. adding section tags around each sentence
1. anding speaker tags
1. adding type="dialogue" attributes