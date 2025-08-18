?airquality

dplyr::glimpse(airquality)

airquality |>
  dplyr::filter(Temp > 70,
                Month > 5)|>
  dplyr::mutate(Temp_C = (Temp-32)*5/9,
                solar_200 = dplyr::case_when(Solar.R>200 ~ 'solar200',
                                             Solar.R<=200 ~ 'solar100'))|>
  dplyr::group_by(Month, solar_200)|>
  dplyr::summarise(mean_temp_c = mean(Temp_C, na.rm=TRUE))

airquality |>
  dplyr::sample_n(10)

train = airquality |>
  dplyr::sample_frac(0.7)

airquality |>
  dplyr::setdiff(train)

airquality |>
  dplyr::arrange(desc(Month), Day)


airquality |>
  dplyr::filter(!is.na(Ozone))|>
  dplyr::group_by(Month)|>
  dplyr::summarise(
    solar_mean = mean(Solar.R, na.rm=TRUE),
    solar_sd = sd(Solar.R, na.rm=TRUE)
  )

#기온이 86도 보다 높은 날의 월별 비율
airquality |>
  dplyr::mutate(Hday = ifelse (Temp>86, '>30도' ,'<=30도')) |>
  dplyr::group_by(Month, Hday) |>
  dplyr::summarise(nH = dplyr::n()) |>
  dplyr::group_by(Month) |>
  dplyr::mutate(percent = nH / sum(nH)) |>
  dplyr::filter(Hday == '>30도') |>
  dplyr::select( - nH)


body<-readr::read_csv("body.csv")

#weight 15, 20번째 관측치 추출
body |>
  dplyr::select(Weight)|>
  dplyr::slice(c(15,20))

#height 단위를 meter로 변환된 변수 mheight mheight 추가
body |>
  dplyr::mutate(mHeight = Height)

#weight 평균 표준편차
body |>
  dplyr::summarise(mean_weight = mean(Weight, na.rm=T),
                   sd_weight = sd(Weight, na.rm=T))

#index 0,1 weak, 2 normal, 3 overweight, 4,5, obesity

body |>
  dplyr::mutate(Index4 = dplyr::case_when(
    Index %in% c(0,1) ~ 'Weak',
    Index == 2 ~ 'Normal',
    Index == 3 ~ 'Overweight',
    Index %in% c(4,5) ~ 'Obesity'))


# Height, Weight의 평균과 표준편차
body |>
  dplyr::summarise(mean_weight = mean(Weight, na.rm=T),
                   sd_weight = sd(Weight, na.rm=T),
                   mean_height = mean(Height, na.rm=T),
                   sd_height = sd(Height, na.rm=T))

# 성별 Height, Weight의 평균과 표준편차
body |>
  dplyr::group_by(Gender)|>
  dplyr::summarise(mean_weight = mean(Weight, na.rm=T),
                   sd_weight = sd(Weight, na.rm=T),
                   mean_height = mean(Height, na.rm=T),
                   sd_height = sd(Height, na.rm=T))

# 체질량 지수 계산
body |>
  dplyr::mutate(mHeight = Height/100,
                bmi = Weight/(mHeight^2))

# 과체중 비율
body |>
  dplyr::mutate(mHeight = Height/100,
                bmi = Weight/(mHeight^2),
                obesity = ifelse(bmi>=30, '과체중', '정상'))|>
  dplyr::group_by(Gender,
                  obesity)|>
  dplyr::summarise(num = dplyr::n()) |>
  dplyr::group_by(Gender)|>
  dplyr::mutate(percent = num/sum(num)) |>
  dplyr::select(-num)
  











