test_that("get_pts() returns an sf dataframe", {
  expect_s3_class(get_pts(), c("sf", "data.frame"))
})

test_that("get_pts() returns an sf dataframe", {
  expect_s3_class(get_pts(.where = "cd_rvr = 'PR'"), c("sf", "data.frame"))
})
