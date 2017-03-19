(defmodule blog-pages
  (export all))

(defun get-content
  "This is a wrapper function that processes the result of an ErlyDTL template
  rendering, returning just the content."
  ((`#(ok ,page)) page)
  ((err) err))

(defun get-priv-dir ()
  (code:priv_dir 'blog))

(defun get-base-page (name)
  'noop)

(defun get-fragment-page (name)
  (file:read_file
    (filename:join `(,(get-priv-dir)
                     "html-fragments"
                     ,name))))

(defun get-page
  (('landing)
    (clj:-> (blog-data:base "Starship Tools")
            (landing-tmpl:render)
            (get-content)))
  (('archives)
    (clj:-> (blog-data:base "Archives")
            (blank-tmpl:render)
            (get-content)))
  (('categories)
    (clj:-> (blog-data:base "Categories")
            (blank-tmpl:render)
            (get-content)))
  (('tags)
    (clj:-> (blog-data:base "Tags")
            (blank-tmpl:render)
            (get-content)))
  (('authors)
    (clj:-> (blog-data:base "Authors")
            (blank-tmpl:render)
            (get-content)))
  (('about)
    (clj:-> (blog-data:base "About")
            (blank-tmpl:render)
            (get-content)))
  (('timeline)
    (clj:-> (blog-data:base "A Timeline of Starship Programs")
            (blank-tmpl:render)
            (get-content)))
  (('search)
    (clj:-> (blog-data:base "Search Results")
            (search-tmpl:render)
            (get-content)))
  (('bootstrap-theme)
    (clj:-> (blog-data:base "Design :: Theme Demo")
            (bootstrap-theme-tmpl:render)
            (get-content)))
  (('example-two-column)
    (clj:-> (blog-data:base "Example :: Two-Column Page")
            (example_two_column-tmpl:render)
            (get-content))))
