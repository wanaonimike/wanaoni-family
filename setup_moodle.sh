#!/usr/bin/env bash
set -e

# 1. Install Composer & Moosh
sudo apt update
sudo apt install -y composer
composer global require moosh/moosh

# Ensure your shell sees Moosh
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# 2. Create a new course
NEW_COURSE_FULL="Terminal Test Course"
NEW_COURSE_SHORT="TTC101"
NEW_COURSE_CAT=1   # use category ID 1 (Miscellaneous) or adjust as needed

COURSE_ID=$(sudo -u www-data php /var/www/html/moodle/admin/cli/create_course.php \
  --fullname="$NEW_COURSE_FULL" \
  --shortname="$NEW_COURSE_SHORT" \
  --categoryid="$NEW_COURSE_CAT" \
  --format=topics \
  --startdate=$(date +%s) \
  --enddate=$(date --date="2025-12-31" +%s) \
  | awk -F'= ' '/cmscourseid/ {print $2}' )

echo "✅ Created course ID: $COURSE_ID ($NEW_COURSE_FULL)"

# 3. Create a question category in the new course
CATEGORY_NAME="TTC Questions"
moosh category-create --courseid="$COURSE_ID" "$CATEGORY_NAME"
echo "✅ Created question category: $CATEGORY_NAME"

# 4. Write two sample MCQs to a GIFT file
cat << 'EOF' > sample_questions.gift
::Q1:: What is 2+2? { =4 ~3 ~5 ~6 }
::Q2:: What color is the sky on a clear day? { =Blue ~Red ~Green ~Yellow }
EOF
echo "✅ Prepared sample_questions.gift"

# 5. Import the GIFT into your new category via Moosh
moosh question-import gift sample_questions.gift \
  --courseid="$COURSE_ID" \
  --category="$CATEGORY_NAME"
echo "✅ Imported sample questions into '$CATEGORY_NAME' for course ID $COURSE_ID"

# Done
echo "All set! Open your course dashboard:"
cmd.exe /C start "http://localhost/moodle/course/view.php?id=$COURSE_ID"

