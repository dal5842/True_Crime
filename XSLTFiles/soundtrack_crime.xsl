<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>True Crime: A Soundtrack Playlist</title>
                <style>
                    body {
                    font-family: Arial, sans-serif;
                    background-color: #f7f7f7;
                    padding: 20px;
                    }
                    .playlist {
                    max-width: 800px;
                    margin: auto;
                    background: #fff;
                    padding: 20px;
                    border-radius: 12px;
                    box-shadow: 0 0 10px rgba(0,0,0,0.1);
                    }
                    .episode {
                    border-bottom: 1px solid #ddd;
                    padding: 10px 0;
                    }
                    .episode:last-child {
                    border-bottom: none;
                    }
                    .episode-number {
                    color: #888;
                    font-size: 0.9em;
                    margin-bottom: 5px;
                    }
                    .song-title {
                    font-size: 1.4em;
                    font-weight: bold;
                    color: #333;
                    margin: 5px 0;
                    }
                    .artist {
                    font-size: 1em;
                    color: #666;
                    margin-bottom: 10px;
                    }
                    .lyrics {
                    font-size: 0.9em;
                    color: #444;
                    white-space: pre-wrap;
                    }
                </style>
            </head>
            <body>
                <div class="playlist">
                    <h1>True Crime: A Soundtrack Playlist</h1>
                    <xsl:for-each select="playlist/episode">
                        <div class="episode">
                            <div class="episode-number">Episode <xsl:value-of select="@type" /></div>
                            <div class="song-title"><xsl:value-of select="song/title" /></div>
                            <div class="artist">by <xsl:value-of select="song/artist" /></div>
                            <div class="lyrics"><xsl:value-of select="song/lyrics" /></div>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
