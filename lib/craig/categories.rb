module Craig
  CATEGORIES = {
    'community' => {
      'path' => 'ccc',
      'children' => {
        'activities' => 'act',
        'artists' => 'ats',
        'childcare' => 'kid',
        'general' => 'com',
        'groups' => 'grp',
        'pets' => 'pet',
        'events' => 'eee', # Diverges. Original: "eve"
        'lost_found' => 'laf',
        'musicians' => 'muc',
        'local news' => 'vnn',
        'politics' => 'pol',
        'rideshare' => 'rid',
        'volunteers' => 'vol',
        'classes' => 'cls'
      }
    },
    'personals' => {
      'children' => {
        'strictly_platonic' => 'stp',
        'women_seek_women' => 'w4w',
        'women_seeking_men' => 'w4m',
        'men_seeking_women' => 'm4w',
        'men_seeking_men' => 'm4m',
        'misc_romance' => 'msr',
        'casual_encounters' => 'cas',
        'missed_connections' => 'mis',
        'rants_and_raves' => 'rnr'
      }
    },
    'housing' => {
      'path' => 'hhh',
      'children' => {
        'apts_housing' => 'apa',
        'rooms_shared' => 'roo',
        'sublets_temporary' => 'sub',
        'housing_wanted' => 'hsw',
        'housing_swap' => 'swp',
        'vacation_rentals' => 'vac',
        'parking_storage' => 'prk',
        'office_commercial' => 'off',
        'real_estate_for_sale' => 'rea'
      }
    },
    'for_sale' => {
      'path' => 'sss',
      'children' => {
        'appliances' => 'ppa',
        'antiques' => 'ata',
        'barter' => 'bar',
        'bikes' => 'bia',
        'boats' => 'boo',
        'books' => 'bka',
        'business' => 'bfa',
        'computer' => 'sya',
        'free' => 'zip',
        'furniture' => 'fua',
        'general' => 'foa',
        'jewelry' => 'jwa',
        'materials' => 'maa',
        'rvs' => 'rva',
        'sporting' => 'sga',
        'tickets' => 'tia',
        'tools' => 'tla',
        'wanted' => 'wan',
        'arts_crafts' => 'ara',
        'auto_parts' => 'pta',
        'baby_kids' => 'baa',
        'beauty_hlth' => 'haa',
        'cars_trucks' => 'cta', # Diverges. Original: "/i/autos"
        'cds_dvd_vhs' => 'ema',
        'cell_phones' => 'moa',
        'clothes_acc' => 'cla',
        'collectibles' => 'cba',
        'electronics' => 'ela',
        'farm_garden' => 'gra',
        'garage_sale' => 'gms',
        'household' => 'hsa',
        'motorcycles' => 'mca',
        'music_instr' => 'msa',
        'photo_video' => 'pha',
        'toys_games' => 'taa',
        'video_gaming' => 'vga'
      }
    },
    'services' => {
      'path' => 'bbb',
      'children' => {
        'beauty' => 'brs',
        'creative' => 'crs',
        'computer' => 'cps',
        'cycle' => 'cys',
        'event' => 'evs',
        'financial' => 'fns',
        'legal' => 'lgs',
        'lessons' => 'lss',
        'marine' => 'mas',
        'pet' => 'pas',
        'automotive' => 'aos',
        'farm_garden' => 'fgs',
        'household' => 'hss',
        'labor_move' => 'lbs',
        'skilld_trade' => 'sks',
        'real_estate' => 'rts',
        'sm_biz_ads' => 'biz',
        'therapeutic' => 'thp',
        'travel_vac' => 'trv',
        'write_ed_tr8' => 'wet'
      }
    },
    'jobs' => {
      'path' => 'jjj',
      'children' => {
        'accounting_finance' => 'acc',
        'admin_office' => 'ofc',
        'arch_engineering' => 'egr',
        'art_media_design' => 'med',
        'biotech_science' => 'sci',
        'business_mgmt' => 'bus',
        'customer_service' => 'csr',
        'education' => 'edu',
        'food_bev_hosp' => 'fbh',
        'general_labor' => 'lab',
        'government' => 'gov',
        'human_resources' => 'hum',
        'internet_engineers' => 'eng',
        'legal_paralegal' => 'lgl',
        'manufacturing' => 'mnu',
        'marketing_pr_ad' => 'mar',
        'medical_health' => 'hea',
        'nonprofit_sector' => 'npo',
        'real_estate' => 'rej',
        'retail_wholesale' => 'ret',
        'sales_biz_dev' => 'sls',
        'salon_spa_fitness' => 'spa',
        'security' => 'sec',
        'skilled_trade_craft' => 'trd',
        'software_qa_dba' => 'sof',
        'systems_network' => 'sad',
        'technical_support' => 'tch',
        'transport' => 'trp',
        'tv_film_video' => 'tfr',
        'web_info_design' => 'web',
        'writing_editing' => 'wri',
        'etc' => 'etc'
      }
    },
    'gigs' => {
      'path' => 'ggg',
      'children' => {
        'crew' => 'cwg',
        'event' => 'evg',
        'labor' => 'lbg',
        'talent' => 'tlg',
        'computer' => 'cpg',
        'creative' => 'crg',
        'domestic' => 'dmg',
        'writing' => 'wrg'
      }
    },
    'resumes' => {
      'path' => 'res'
    }
  }
end
