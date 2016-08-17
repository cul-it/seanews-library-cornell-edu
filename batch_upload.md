## Uploading Issues to seapapers.library.cornell.edu

Updated - jgr25 8/15/2016

### Description

Basic information about uploading newspaper Issues and Issue Documents to the SEAPapers web site. Description of file formats and process.

### Data types

1. Publication
  * add new Publications via Drupal interface
2. Issue
  * Title
  * Body
  * Issue ID - unique name for this issue - text
    * calculated as a hash of publication, date, volume
  * Publication Reference - select the 'Title' of the Publication this issue belongs in - entity reference
  * Issue Date - date
  * Issue Volume - volume and issue number, varies by publication - text
  * note: no documet is stored with the Issue data type
3. Issue Part
  * Title
  * Issue Part ID - unique id for this part of the issue - text
    * calculated as a hash of issue, part order
  * Issue Part Order - number for setting the order of the parts. used ascending - float
  * Issue Part Document - uploaded file for this issue, allows multi-document issues - file
  * Issue Reference - select the 'Title' of Issue this part belongs in - entity reference
  * Issue Part Description - optional description for this article - text

### CSV file formats

2. Issue Import CSV File
  * /import/issue_import
  * template: issue_import_template.csv
3. Issue Part CSV file
  * /import/issue_parts_import
  * template: issue_parts_import_template.csv

## Procedure

1. Create publication node in Drupal if necessary.
2. Build csv file for issues. One record per issue. Be sure combined publication, date and volume are unique.
3. Import issues csv file.
4. Build csv file for issue parts. One record per document. Be sure combined issue and part order are unique.
5. Import issue parts csv file.

## Amazon S3 naming conventions

- see [Object Naming Guidelines] (http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html)
- The following character sets are generally safe for use in key names:
  - Alphanumeric characters [0-9a-zA-Z]
  - Special characters !, -, _, ., *, ', (, and )


