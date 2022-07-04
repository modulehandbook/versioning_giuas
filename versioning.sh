# usage: versioning.sh <semester_tag_name>
COURSES_URL=https://module-handbook.herokuapp.com/export_courses_json
PROGRAMS_URL=https://module-handbook.herokuapp.com/export_programs_json

# download and save courses
echo "Exporting Courses"
curl ${COURSES_URL} > courses.json -H "Accept: application/json"
echo "Exporting Courses Done"
# download and save programs (with their courses)
echo "Exporting Programs"
curl ${PROGRAMS_URL} > programs.json -H "Accept: application/json"
echo "Exporting Programs Done"

# add
git add .
# commit
git commit -m "version $(date)"
# push
git push origin main

# Tag if tag given as a parameter
if [ -n $1 ]
then
  # tag
  git tag $1
  # push
  git push origin $1
fi
