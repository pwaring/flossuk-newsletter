#!/bin/bash

set -u
set -e

export NEWSLETTER_YEAR=${NEWSLETTER_YEAR:-}

if [ -z ${NEWSLETTER_YEAR} ]; then
  echo "No newsletter year specified"
  exit 1;
fi

cd ${NEWSLETTER_YEAR}

cat metadata.md > output/newsletter.md

# 1. FLOSS UK standing items: Secretariat, Chair, Editor, Obituaries
sed -s '$a\\n----\n' content/flossuk/secretariat.md >> output/newsletter.md
sed -s '$a\\n----\n' content/flossuk/editor.md >> output/newsletter.md

# 2. Upcoming events in ascending date order
sed -s '$a\\n----\n' content/upcoming-events/*.md >> output/newsletter.md

# 3. Past event reviews in ascending date order, ascending order of author surname
sed -s '$a\\n----\n' content/past-events/*.md >> output/newsletter.md

# 4. Articles in ascending order of author surname
sed -s '$a\\n----\n' content/articles/*.md >> output/newsletter.md

# 5. Book reviews in ascending order of author surname
sed -s '$a\\n----\n' content/book-reviews/*.md >> output/newsletter.md

# 6. Contributors page in ascending order of author surname
sed -s '$a\\n\n' content/contributors/*.md >> output/newsletter.md

# 7. Contact pages in ascending order of author surname


pandoc --toc --toc-depth=1 --template=../template.tex output/newsletter.md -o output/newsletter.pdf
