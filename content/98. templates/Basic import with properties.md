
> [!info]- Info - [**Zotero**]({{desktopURI}})  | {% for attachment in attachments | filterby("path", "endswith", ".pdf") %}[**PDF**](file:///{{attachment.path | replace(" ", "%20")}}){%- endfor %}

