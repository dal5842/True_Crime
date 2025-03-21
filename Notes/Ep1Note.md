# Episode 1 Markdown Notes
1.) Character names to tags
    Find: `^([A-Za-z]+(?:\s[A-Za-z]+)*)\s*:\s*(.*)`
    Replace: 1<dialogue>\n\t<character>\1</character>\n\t<line>\2</line>\n</dialogue>`
    
2.) Wrapp Scenes in action tag
    Find: `(?<=\n)([A-Z][a-z]+.*?)(?=\n\n|$)`
    Replace: `<action>$1</action>`
    
3.) Wrap Sound Ques
    Find: `^(.+? by .+? plays .*?)$`
    Replace: `<sound>\1</sound>`
    
4.)Format Flashbacks
    Find: `Flashback to (.*?)\n`
    Replace: `<flashback><action>Scene set in $1.</action>`
    
5.) Standerize legends
    Find: `Legend: (.*?)\n`
    Replace: `<legend>$1</legend>`
    
6.) Review xml and fix any discrepinceys

