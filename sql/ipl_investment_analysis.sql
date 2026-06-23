-- ============================================
-- IPL Investment Analysis
-- Franchise Wins View
-- ============================================

CREATE OR REPLACE VIEW wins_view AS

SELECT
    CASE
        WHEN winner IN ('Delhi Daredevils','Delhi Capitals')
            THEN 'DC'

        WHEN winner IN ('Kings XI Punjab','Punjab Kings')
            THEN 'PBKS'

        WHEN winner IN ('Royal Challengers Bangalore',
                         'Royal Challengers Bengaluru')
            THEN 'RCB'

        WHEN winner IN ('Rising Pune Supergiant',
                         'Rising Pune Supergiants')
            THEN 'RPS'

        WHEN winner = 'Mumbai Indians'
            THEN 'MI'

        WHEN winner = 'Chennai Super Kings'
            THEN 'CSK'

        WHEN winner = 'Kolkata Knight Riders'
            THEN 'KKR'

        WHEN winner = 'Rajasthan Royals'
            THEN 'RR'

        WHEN winner = 'Sunrisers Hyderabad'
            THEN 'SRH'

        WHEN winner = 'Gujarat Titans'
            THEN 'GT'

        WHEN winner = 'Lucknow Super Giants'
            THEN 'LSG'

        WHEN winner = 'Deccan Chargers'
            THEN 'DCG'

        WHEN winner = 'Gujarat Lions'
            THEN 'GL'

        WHEN winner = 'Kochi Tuskers Kerala'
            THEN 'KTK'

        WHEN winner = 'Pune Warriors'
            THEN 'PW'

        ELSE winner
    END AS franchise,

    COUNT(*) AS wins

FROM matches

WHERE winner IS NOT NULL
  AND winner <> 'None'

GROUP BY franchise;

-- ============================================
-- matches_played_view
-- ============================================
CREATE OR REPLACE VIEW matches_played_view AS

SELECT
    franchise,
    COUNT(*) AS matches_played

FROM
(
    SELECT
        CASE
            WHEN team1 IN ('Delhi Daredevils','Delhi Capitals') THEN 'DC'
            WHEN team1 IN ('Kings XI Punjab','Punjab Kings') THEN 'PBKS'
            WHEN team1 IN ('Royal Challengers Bangalore',
                           'Royal Challengers Bengaluru') THEN 'RCB'
            WHEN team1 IN ('Rising Pune Supergiant',
                           'Rising Pune Supergiants') THEN 'RPS'
            WHEN team1 = 'Mumbai Indians' THEN 'MI'
            WHEN team1 = 'Chennai Super Kings' THEN 'CSK'
            WHEN team1 = 'Kolkata Knight Riders' THEN 'KKR'
            WHEN team1 = 'Rajasthan Royals' THEN 'RR'
            WHEN team1 = 'Sunrisers Hyderabad' THEN 'SRH'
            WHEN team1 = 'Gujarat Titans' THEN 'GT'
            WHEN team1 = 'Lucknow Super Giants' THEN 'LSG'
            WHEN team1 = 'Deccan Chargers' THEN 'DCG'
            WHEN team1 = 'Gujarat Lions' THEN 'GL'
            WHEN team1 = 'Kochi Tuskers Kerala' THEN 'KTK'
            WHEN team1 = 'Pune Warriors' THEN 'PW'
            ELSE team1
        END AS franchise

    FROM matches

    UNION ALL

    SELECT
        CASE
            WHEN team2 IN ('Delhi Daredevils','Delhi Capitals') THEN 'DC'
            WHEN team2 IN ('Kings XI Punjab','Punjab Kings') THEN 'PBKS'
            WHEN team2 IN ('Royal Challengers Bangalore',
                           'Royal Challengers Bengaluru') THEN 'RCB'
            WHEN team2 IN ('Rising Pune Supergiant',
                           'Rising Pune Supergiants') THEN 'RPS'
            WHEN team2 = 'Mumbai Indians' THEN 'MI'
            WHEN team2 = 'Chennai Super Kings' THEN 'CSK'
            WHEN team2 = 'Kolkata Knight Riders' THEN 'KKR'
            WHEN team2 = 'Rajasthan Royals' THEN 'RR'
            WHEN team2 = 'Sunrisers Hyderabad' THEN 'SRH'
            WHEN team2 = 'Gujarat Titans' THEN 'GT'
            WHEN team2 = 'Lucknow Super Giants' THEN 'LSG'
            WHEN team2 = 'Deccan Chargers' THEN 'DCG'
            WHEN team2 = 'Gujarat Lions' THEN 'GL'
            WHEN team2 = 'Kochi Tuskers Kerala' THEN 'KTK'
            WHEN team2 = 'Pune Warriors' THEN 'PW'
            ELSE team2
        END AS franchise

    FROM matches

) x

GROUP BY franchise;

-- ============================================
-- franchise_performance
-- ============================================

CREATE OR REPLACE VIEW franchise_performance AS

SELECT
    w.franchise,
    w.wins,
    m.matches_played,

    ROUND(
        (w.wins * 100.0) / m.matches_played,
        2
    ) AS win_rate

FROM wins_view w
JOIN matches_played_view m
ON w.franchise = m.franchise;

-- ============================================
-- franchise_spending
-- ============================================

CREATE OR REPLACE VIEW franchise_spending AS

SELECT
    franchise_std AS franchise,
    ROUND(SUM(price_cr),2) AS total_spend_cr

FROM
(
    SELECT
        CASE
            WHEN franchise = 'KXIP' THEN 'PBKS'
            WHEN franchise = 'DD' THEN 'DC'
            WHEN franchise = 'Pune Warriors India' THEN 'PW'
            ELSE franchise
        END AS franchise_std,

        price_cr

    FROM auction_master
) x

GROUP BY franchise_std;

-- =====================================================
-- Franchise Brand Value
-- =====================================================

CREATE OR REPLACE VIEW franchise_brand_value AS

SELECT
    CASE
        WHEN Team = 'DD' THEN 'DC'
        WHEN Team = 'KXIP' THEN 'PBKS'
        ELSE Team
    END AS franchise,

    MAX(Brand_Value_INR_Crore) AS brand_value

FROM brand_values

GROUP BY franchise;

-- =====================================================
-- Franchise Growth Analysis
-- =====================================================

CREATE OR REPLACE VIEW franchise_growth AS

SELECT
    franchise,
    ROUND(AVG(growth_pct),2) AS avg_growth

FROM
(
    SELECT
        CASE
            WHEN Team = 'DD' THEN 'DC'
            WHEN Team = 'KXIP' THEN 'PBKS'
            ELSE Team
        END AS franchise,

        ROUND(
            (
                (
                    Brand_Value_INR_Crore
                    -
                    LAG(Brand_Value_INR_Crore)
                    OVER (
                        PARTITION BY Team
                        ORDER BY Year
                    )
                )
                /
                LAG(Brand_Value_INR_Crore)
                OVER (
                    PARTITION BY Team
                    ORDER BY Year
                )
            ) * 100,
            2
        ) AS growth_pct

    FROM brand_values

) x

WHERE growth_pct IS NOT NULL

GROUP BY franchise;

-- =====================================================
-- Franchise Investment Analysis
-- =====================================================

CREATE OR REPLACE VIEW franchise_investment_analysis AS

SELECT
    p.franchise,
    p.wins,
    p.matches_played,
    p.win_rate,

    s.total_spend_cr,

    ROUND(
        s.total_spend_cr / p.wins,
        2
    ) AS cost_per_win,

    b.brand_value,

    g.avg_growth

FROM franchise_performance p

JOIN franchise_spending s
    ON p.franchise = s.franchise

JOIN franchise_brand_value b
    ON p.franchise = b.franchise

JOIN franchise_growth g
    ON p.franchise = g.franchise;
    
-- =====================================================
-- Moneyball Ranking Model
-- =====================================================

CREATE OR REPLACE VIEW moneyball_ranks AS

SELECT
    franchise,

    RANK() OVER (
        ORDER BY win_rate DESC
    ) AS win_rank,

    RANK() OVER (
        ORDER BY cost_per_win ASC
    ) AS efficiency_rank,

    RANK() OVER (
        ORDER BY avg_growth DESC
    ) AS growth_rank

FROM franchise_investment_analysis;

-- =====================================================
-- Investment Recommendations
-- =====================================================

CREATE OR REPLACE VIEW investment_recommendations AS

SELECT
    x.franchise,
    x.moneyball_score,

    CASE
        WHEN x.moneyball_score <= 4.5 THEN 'BUY'
        WHEN x.moneyball_score <= 6 THEN 'HOLD'
        ELSE 'AVOID'
    END AS recommendation

FROM
(
    SELECT
        franchise,

        ROUND(
            (
                RANK() OVER (
                    ORDER BY win_rate DESC
                ) * 0.4

                +

                RANK() OVER (
                    ORDER BY cost_per_win ASC
                ) * 0.4

                +

                RANK() OVER (
                    ORDER BY avg_growth DESC
                ) * 0.2
            ),
            2
        ) AS moneyball_score

    FROM franchise_investment_analysis

) x;