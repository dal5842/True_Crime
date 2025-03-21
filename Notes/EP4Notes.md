# EP 4 "Church Going People" Notes

1. Searched for the `&` sign 
2. Searched for the the `<` and `>` signs
3. Removed the extra blank lines `\n\n\n+`
4. Found dialouge that was split into two lines that should be combined them into one line `(?<!\n\n)\n(?!\n)`
5. Had to insert a new line after each line since they were removed: 
Find `(.+)` 
Replace `\1\n`
6. Applied this XML structure to each line to optimize analysis (credits to Emily): 
`<scene>
	<type>Dialogue</type>
	<speaker>Unknown</speaker>
	<line>text</line>
</scene>`
Find `^(.+)$` 
Replace `<scene>\n\t<type>Dialogue</type>\n\t<speaker>Unknown</speaker>\n\t<line>\1</line>\n</scene>`
7. Wrapped the entire text with a transcript element

To Be Added:
1. Updated each speaker tag to it's respective character
2. Add more "quote on quote" metadata (episode name, season # in beginning)
3. Find a means to censor any words neseccary (maybe through XSLT)