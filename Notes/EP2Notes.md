## Episode 2 Steps:

1.Preprocessed the Text
   - Removed extra blank lines.
   - Replaced any special characters (e.g., `&`, `<`, `>`) with their appropriate XML entities.
   - Standardized spacing and punctuation inconsistencies.

2. Handled Censored Words
   - Identified words marked with an asterisk (*) as censored terms.
   - Wrapped them in `<censored>` tags (e.g., `****` → `<censored>****</censored>`).

3. Tagged Crime-Related Terms
   - Used regex patterns to identify terms related to crime (e.g., `DNA`, `murder`, `homicide`).
   - Wrapped detected words in `<crime_term>` tags.

4. Tagged Question Words
   - Identified interrogative phrases using regex.
   - Wrapped them in `<question>` tags.

5. Formatted Special Lines
   - Lines starting with a hyphen (`-`) were wrapped in `<hyphen>` tags.
   - Lines containing slashes (`/`) were wrapped in `<slash>` tags.

6. Standardized Repeated Phrases
   - Example: `Be quite` was wrapped as `<beQuite>Be quite</beQuite>`.
   - `Quite` was wrapped separately as `<Quite>Quite</Quite>`.

7. Structured the Content
   - Sectioned out different parts of the transcript (e.g., music cues, titles, author information).
   - Tagged each segment appropriately (e.g., `<title>`, `<author>`, `<lyrics>`).

8. Wrapped Each Line in XML Tags
   - Used regex to wrap every line in `<line>` tags for structured formatting.
   - Ensured that the regex did not overmatch or miss any content.

9. Added Root Element
    - After converting to XML, a root `<transcript>` element was added to contain all lines.

10. Tagged Additional Elements
    - Names of individuals were wrapped in `<name>` tags.
    - Swear words were tagged within `<swear>` tags.
    - Descriptions of people’s appearances were wrapped in `<description>` tags.
    - Any references to DNA or evidence-related terms were enclosed in `<evidence>` tags.

## Future Updates After Reviewing the Episode:

1. Add Character Attributes
   - Include character ranks or roles in the show.
2. Tag Locations
   - Identify and mark places mentioned in the dialogue.
3. Refine Line Transcription
   - Restructure lines to reflect natural speech patterns.
4. Tag Speaker Information
   - Label each section with the name of the person speaking.
5. Identify Scene Settings
   - Add `<setting>` tags to denote where events take place.
6. Find and Fix Missed Patterns
   - Review for any additional elements requiring tagging.
