require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New Course"

    fill_in "Capacity", with: @course.capacity
    fill_in "Code", with: @course.code
    fill_in "Dayofweek", with: @course.dayofweek
    fill_in "Description", with: @course.description
    fill_in "End time", with: @course.end_time
    fill_in "Location", with: @course.location
    fill_in "Professor", with: @course.professor
    fill_in "Start time", with: @course.start_time
    fill_in "Title", with: @course.title
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    fill_in "Capacity", with: @course.capacity
    fill_in "Code", with: @course.code
    fill_in "Dayofweek", with: @course.dayofweek
    fill_in "Description", with: @course.description
    fill_in "End time", with: @course.end_time
    fill_in "Location", with: @course.location
    fill_in "Professor", with: @course.professor
    fill_in "Start time", with: @course.start_time
    fill_in "Title", with: @course.title
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
