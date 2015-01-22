;; drush make file for seanews
;;

core = 7.x
api = 2
projects[drupal][version] = "7.34"

libraries[jquery.ui][directory_name] = "jquery.ui"
libraries[jquery.ui][download][type] = "get"
libraries[jquery.ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery-ui-1.8.17.zip"
libraries[SolrPhpClient][destination] = modules/apachesolr
libraries[SolrPhpClient][directory_name] = "SolrPhpClient"
libraries[SolrPhpClient][download][type] = "get"
libraries[SolrPhpClient][download][url] = "http://solr-php-client.googlecode.com/files/SolrPhpClient.r22.2009-11-09.tgz"
projects[admin_menu][version] = "3.0-rc5"
projects[adminrole] = "1.0"
projects[advanced_help][version] = "1.1"
projects[apachesolr][version] = "1.7"
projects[apachesolr_attachments][version] = "1.3"
projects[auto_nodetitle][version] = "1.0"
projects[autosave][version] = "2.2"
projects[bluemasters][version] = "2.1"
projects[captcha][version] = "1.0"
projects[cck][version] = "3.0-alpha3"
projects[computed_field][patch][] = "http://www.drupal.org/files/computed_field-ckk_content_migrate_resets_field_length-1645642-1.patch"
projects[computed_field][version] = "1.0"
projects[content_access][version] = "1.2-beta2"
projects[content_taxonomy][version] = "1.0-beta2"
projects[context][version] = "3.6"
projects[css_injector][version] = "1.10"
projects[ctools][version] = "1.5"
projects[date][version] = "2.8"
projects[ddf][version] = "1.6"
projects[devel][version] = "1.5"
projects[email][version] = "1.3"
projects[emfield][version] = "1.0-alpha2"
projects[entity][version] = "1.5"
projects[entityreference][version] = "1.1"
projects[entityreference_prepopulate][version] = "1.5"
projects[eva][version] = "1.2"
projects[features][version] = "2.3"
projects[features_extra] = "1.0-beta1"
projects[feeds][version] = "2.0-alpha8"
projects[feeds_tamper][version] = "1.0"
projects[filefield_paths][version] = "1.0-beta4"
projects[globalredirect][version] = "1.5"
projects[imageapi][version] = "1.x-dev"
projects[imce][version] = "1.9"
projects[imce_wysiwyg][version] = "1.0"
projects[ip_login][version] = "2.0"
projects[job_scheduler][version] = "2.0-alpha3"
projects[jquery_update][version] = "2.4"
projects[link][version] = "1.3"
projects[media][version] = "1.4"
projects[menu_breadcrumb][version] = "1.5"
projects[migrate][version] = "2.6"
projects[mimedetect][version] = "1.0-beta1"
projects[mimedetect][patch][] = "http://www.drupal.org/files/mimedetect-magic.patch"
projects[page_title][version] = "2.7"
projects[pathauto][version] = "1.2"
projects[private_files_download_permission][version] = "2.3"
projects[recaptcha][version] = "1.11"
projects[redirect][version] = "1.0-rc1"
projects[references][version] = "2.1"
projects[restrict_by_ip][version] = "3.0"
projects[seanews][branch] = "master"
projects[seanews][directory_name] = "seanews"
projects[seanews][download][type] = "git"
projects[seanews][download][url] = "git@github.com:cul-it/seanews.git"
projects[seanews][type] = "module"
projects[seo_checklist][version] = "4.1"
projects[simplesaml_authentication_cul][download][type] = "get"
projects[simplesaml_authentication_cul][download][url] = "https://featureserver.library.cornell.edu/sites/featureserver.library.cornell.edu/files/fserver/simplesaml_authentication_for_cul-7.x-1.0-rc3.tar"
projects[simplesaml_authentication_cul][location] = "https://featureserver.library.cornell.edu/fserver"
projects[simplesaml_authentication_cul][type] = "module"
projects[simplesamlphp_auth][version] = "2.0-alpha2"
projects[site_map][version] = "1.2"
projects[skeletontheme][version] = "1.4"
projects[strongarm][version] = "2.0"
projects[taxonomy_manager][version] = "1.0"
projects[token][version] = "1.5"
projects[transliteration][version] = "3.2"
projects[uiplog][version] = "1.0-beta2"
projects[views][version] = "3.8"
projects[views_bulk_operations][version] = "3.2"
projects[views_data_export][version] = "3.0-beta8"
projects[wysiwyg][version] = "2.2"
projects[xmlsitemap][version] = "2.1"
projects[zen][version] = "5.5"

