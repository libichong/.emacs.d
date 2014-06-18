(define-abbrev-table
  'c-mode-abbrev-table '(
                         ("cb" "" c-comment-box-skeleton 1)
                         ("ife" "" c-if-else-skeleton 1)
                         ("if" "" c-if-skeleton 1)
                         ("while" "" c-while-skeleton 1)
                         ("main" "" c-main-func-skeleton 1)
                         ("struct" "" c-struct-skeleton 1)
                         ("do" "" c-do-skeleton 1)
                         ("else" c-electric-continued-statement 0)
                         ("lb" "" c-long-brief-skeleton 1)
                         ("sb" "" c-short-brief-skeleton 1)
                         ("for" "" c-for-skeleton 1)
                         ("ch" "" c-file-head-skeleton 1)
                         ))

(define-skeleton single-quote-pair-skeleton "Inserts ''" nil "'" _ "'")
(define-skeleton double-quote-pair-skeleton "Inserts ''" nil "\"" _ "\"")
(define-skeleton brace-pair-skeleton "Inserts ''" nil "{" _ "}")
(define-skeleton paren-pair-skeleton "Inserts ''" nil "(" _ ")")
(define-skeleton bracket-pair-skeleton "Inserts ''" nil "[" _ "]")

(define-skeleton c-main-func-skeleton
  "create int main(int argc, char * argv[]) automatic" nil
  "int main (int argc, char * argv[]) \n{\n"
  > _ "\n" > "return 0;"
  "\n}")

(define-skeleton c-comment-box-skeleton
  "create a comment box" nil
  "/**********************************************\n"
  > " * " _ "\n"
  > " **********************************************/"
  )

(define-skeleton c-if-skeleton
  "Insert an if () {} region" nil
  > "if (" _ ") {" > \n
  "}" > \n)

(define-skeleton c-if-else-skeleton
  "Insert an if () {} else {}region" nil
  > "if (" _ ") {" \n
  "} else {" > \n
  "}" >)

(define-skeleton c-for-skeleton
  "Insert a 'for () {}' region" nil
  > "for ("_") {" > \n
  "}" > \n)

(define-skeleton c-while-skeleton
  "Insert a 'while () {}' region" nil
  > "while ("_") {" > \n
  "}" > \n)

(define-skeleton c-do-skeleton
  "Insert a 'do {} while ()' region" nil
  > "do {" > \n
  _ > \n
  "} while ()" > \n)

(define-skeleton c-struct-skeleton
  "Insert a 'struct {};' region" nil
  > "struct "_" {" > \n
  "};" > \n
  )

(define-skeleton c-short-brief-skeleton
  "Insert a '//! \\brief' comment" nil
  "//! \\brief " _
  )

(define-skeleton c-long-brief-skeleton
  "Insert a /*! \\brief .. */ comment" nil
  "/*! \\brief " > _ \n
  "*/" > \n
  )

(provide 'csingleton)
