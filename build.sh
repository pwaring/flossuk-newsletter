#!/bin/bash

set -u
set -e

NEWSLETTER_YEAR=$1

if [ -z ${NEWSLETTER_YEAR} ]; then
  echo "No newsletter year specified"
  exit 1;
fi

cd ${NEWSLETTER_YEAR}

if [ ! -d output/ ]; then
  mkdir output
fi

if [ -f metadata.md ]; then
  cat metadata.md > output/newsletter.md

  # 1. FLOSS UK standing items: Secretariat, Chair, Editor, Obituaries
  if [ -f content/flossuk/secretariat.md ]; then
    sed -s '$a\\n----\n' content/flossuk/secretariat.md >> output/newsletter.md
  fi

  if [ -f content/flossuk/editor.md ]; then
    sed -s '$a\\n----\n' content/flossuk/editor.md >> output/newsletter.md
  fi

  # 2. Upcoming events in ascending date order
  if [ -d content/upcoming-events/ ]; then
    if test -n "$(find content/upcoming-events/ -maxdepth 1 -name '*.md' -print -quit)"
    then
      sed -s '$a\\n----\n' content/upcoming-events/*.md >> output/newsletter.md
    fi
  fi

  # 3. Past event reviews in ascending date order, ascending order of author surname
  if [ -d content/past-events/ ]; then
    if test -n "$(find content/past-events/ -maxdepth 1 -name '*.md' -print -quit)"
    then
      sed -s '$a\\n----\n' content/past-events/*.md >> output/newsletter.md
    fi
  fi

  # 4. Articles in ascending order of author surname
  if [ -d content/articles/ ]; then
    if test -n "$(find content/articles/ -maxdepth 1 -name '*.md' -print -quit)"
    then
      sed -s '$a\\n----\n' content/articles/*.md >> output/newsletter.md
    fi
  fi

  # 5. Book reviews in ascending order of author surname
  if [ -d content/book-reviews/ ]; then
    if test -n "$(find content/book-reviews/ -maxdepth 1 -name '*.md' -print -quit)"
    then
      sed -s '$a\\n----\n' content/book-reviews/*.md >> output/newsletter.md
    fi
  fi

  # 6. Contributors page in ascending order of author surname
  if [ -d content/contributors/ ]; then
    if test -n "$(find content/contributors/ -maxdepth 1 -name '*.md' -print -quit)"
    then
      sed -s '$a\\n\n' content/contributors/*.md >> output/newsletter.md
    fi
  fi

  pandoc --toc --toc-depth=1 --template=../template.tex output/newsletter.md -o output/newsletter.pdf
else
  echo "Newsletter metadata (metadata.md) does not exist"
  exit 1
fi
