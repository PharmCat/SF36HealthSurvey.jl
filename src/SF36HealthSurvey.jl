# Ware, John & MA, Kosinski & Keller, S.D.. (1993). SF-36 Physical and Mental Health Summary Scales: a User's Manual. 8. 23-28.
# Ware, John & Kosinski, M. & Gandek, B.. (1993). SF-36 Health Survey: Manual & Interpretation Guide. Lincoln, RI: QualityMetric Incorporated.
# Jenkinson C, Stewart-Brown S, Petersen S, Paice C. Assessment of the SF-36 version 2 in the United Kingdom. J Epidemiol Community Health. 1999 Jan;53(1):46-50. doi: 10.1136/jech.53.1.46. PMID: 10326053; PMCID: PMC1756775.
# Crispin Jenkinson, Comparison of UK and US methods for weighting and scoring the SF-36 summary measures
# Grassi, M. and Nucera, A. (2010), Dimensionality and Summary Measures of the SF-36 v1.6: Comparison of Scale- and Item-Based Approach Across ECRHS II Adults Population. Value in Health, 13: 469-478. https://doi.org/10.1111/j.1524-4733.2010.00703.x

module SF36HealthSurvey

import Base: show

export sf36, sf12

struct SF36Result
    PCS::Float64
    MCS::Float64
    PF::Float64
    RP::Float64
    BP::Float64
    GH::Float64
    VT::Float64
    SF::Float64
    RE::Float64
    MH::Float64
end

struct SF12Result
    PCS::Float64
    MCS::Float64
end

function scorev1(v)
    PFZ = (v[1] - 84.52404)/ 22.89490
    RPZ = (v[2] - 81.19907)/33.797290
    BPZ = (v[3] - 75.49196)/23.558790
    GHZ = (v[4] - 72.21316)/20.16964
    VTZ = (v[5] - 61.05453)/20.86942
    SFZ = (v[6] - 83.59753)/22.37642
    REZ = (v[7] - 81.29467)/ 33.02717
    MHZ = (v[8] - 74.84212)/ 18.01189

    PHc = (PFZ * 0.42402) + (RPZ * 0.35119) + (BPZ * 0.31754) + (SFZ * - 0.00753) + (MHZ
* -0.22069) + (REZ * -0.19206) + (VTZ * 0.02877) + (GHZ * 0.24954)
    PCS = (PHc * 10) + 50 #Transformed Phisical PCS

    MHc = (PFZ * -0.22999) + (RPZ * -0.12329) + (BPZ * -0.09731) + (SFZ * 0.26876) + (MHZ
* 0.48581) + (REZ * 0.43407) + (VTZ * 0.23534) + (GHZ * -0.01571)
    MCS = (MHc * 10) + 50 #Transformed Mental MCS
    PCS, MCS
end
function scorev2(v)
    PFZ = (v[1] - 84.52404)/ 22.89490
    RPZ = (v[2] - 81.19907)/33.797290
    BPZ = (v[3] - 75.49196)/23.558790
    GHZ = (v[4] - 72.21316)/20.16964
    VTZ = (v[5] - 61.05453)/20.86942
    SFZ = (v[6] - 83.59753)/22.37642
    REZ = (v[7] - 81.29467)/ 33.02717
    MHZ = (v[8] - 74.84212)/ 18.01189

    PHc = (PFZ * 0.34450) + (RPZ * 0.30379) + (BPZ * 0.27858) + (GHZ * 0.23562) + (VTZ * 0.09233) + 
    (SFZ * 0.06661) + (REZ * -0.06539)  + (MHZ* -0.07870) 

    PCS = (PHc * 10) + 50 #Transformed Phisical PCS

    MHc = (PFZ * -0.10655) + (RPZ * -0.02356) + (BPZ * -0.00766) + (GHZ * 0.05247) + (VTZ * 0.23434) + 
    (SFZ * 0.25667) + (REZ * 0.36583) + (MHZ* 0.40787) 

    MCS = (MHc * 10) + 50 #Transformed Mental MCS
    PCS, MCS
end

"""
    sf36(v; version = :v1)

Calculate SF36 results for vector of answers `v`.

version keyword:

* `:v1` - General US population (Ware, John & MA, Kosinski & Keller, S.D.. (1993). SF-36 Physical and Mental Health Summary Scales: a User's Manual. 8. 23-28.)
* `:v2` - Correlated scores (Grassi, M. and Nucera, A. (2010), Dimensionality and Summary Measures of the SF-36 v1.6: Comparison of Scale- and Item-Based Approach Across ECRHS II Adults Population. Value in Health, 13: 469-478.)


Vector `v`:

1,33:36 - General Health(GH) - 1, 11a:11d

3:12 - Physical functioning (PF) - 3a:3j

13:16 - Role-Physical Functioning (RP) - 4a:4d

17:19 - RoleEmotional (RE) - 5a:5c

20,32 - Social Functioning (SF) - 6,10

21,22 - Bodily pain (BP) - 7,8

24:26,28,30 - Mental Health (MH) - 9b:9d, 9f, 9h

23,27,29,31 - Vitality (VT) - 9a, 9e, 9g, 9i 

"""
function sf36(v; version = :v1)

    if length(v) != 36 error("Length is not 36!") end

    #Physical functioning - PF
    PFsum = sum(view(v, 3:12))
    PF = ((PFsum - 10) / 20) * 100
    #Role-Physical Functioning - RP
    RPsum = sum(view(v, 13:16))
    RP = ((RPsum - 4) / 4) * 100
    #Bodily pain - BP
    if v[21] > 0 && v[22] > 0
        if v[21] == 1
            BP7 = 6
        elseif v[21] == 2
            BP7 = 5.4
        elseif v[21] == 3
            BP7 = 4.2
        elseif v[21] == 4
            BP7 = 3.1
        elseif v[21] == 5
            BP7 = 2.2
        elseif v[21] == 6
            BP7 = 1
        else
            error("Question BP7(21)")
        end
        #BP8
        if v[22] == 1 && v[21] == 1
            BP8 = 6
        elseif v[22] == 1 && (v[21] >= 2 && v[21] <= 6)
            BP8 = 5
        elseif v[22] == 2
            BP8 = 4
        elseif v[22] == 3
            BP8 = 3
        elseif v[22] == 4
            BP8 = 2
        elseif v[22] == 5
            BP8 = 1
        else
            error("Question BP8(22)")
        end
    elseif v[21] > 0
        if v[21] == 1
            BP7 = 6
        elseif v[21] == 2
            BP7 = 5.4
        elseif v[21] == 3
            BP7 = 4.2
        elseif v[21] == 4
            BP7 = 3.1
        elseif v[21] == 5
            BP7 = 2.2
        elseif v[21] == 6
            BP7 = 1
        else
            error("Question BP7(21)")
        end
        BP8 = BP7
    elseif v[22] > 0
        if v[22] == 1
            BP8 = 6
        elseif v[22] == 2
            BP8 = 4.75
        elseif v[22] == 3
            BP8 = 3.5
        elseif v[22] == 4
            BP8 = 2.25
        elseif v[22] == 5
            BP8 = 1
        else
            error("Question BP8(22)")
        end
        BP7 = BP8
    else
        error()
    end
    BP = (((BP7 + BP8) - 2 )/ 10 ) * 100
    #BP7 & BP8 end

    #General Health - GH
    if v[1] == 1
        GH1 = 5
    elseif v[1] == 2
        GH1 = 4.4
    elseif v[1] == 3
        GH1 = 3.4
    elseif v[1] == 4
        GH1 = 2
    elseif v[1] == 5
        GH1 = 1
    else
        error("Question GH1(1)")
    end

    if 5 >= v[34] >= 1
        GH11b = 6 - v[34]
    else
        error("Question GH11b(34)")
    end

    if 5 >= v[36] >= 1
        GH11d = 6 - v[36]
    else
        error("Question GH11d(36)")
    end
    GHsum = GH1 + GH11b + GH11d + v[33] + v[35]
    GH = ((GHsum - 5)/ 20) * 100

    # Vitality - VT
    if 6 >= v[23] >= 1
        VT9a = 7 - v[23]
    else
        error("Question VT9a(23)")
    end
    if 6 >= v[27] >= 1
        VT9e = 7 - v[27]
    else
        error("Question VT9e(27)")
    end
    VTsum = VT9a + VT9e + v[29] + v[31]
    VT = ((VTsum - 4)/ 20) * 100

    #Social Functioning - SF
    if 5 >= v[20] >= 1
        SF6 = 6 - v[20]
    else
        error("Question SF6(20)")
    end
    SFsum = SF6 + v[32]
    SF = ((SFsum - 2)/ 8) * 100

    #RoleEmotional - RE
    REsum = sum(view(v, 17:19))
    RE = ((REsum - 3)/ 3) * 100

    #Mental Health - MH
    if 6 >= v[26] >= 1
        MH9d = 7 - v[26]
    else
        error("Question MH9d(26)")
    end

    if 6 >= v[30] >= 1
        MH9h = 7 - v[30]
    else
        error("Question MH9h(30)")
    end
    MHsum = MH9d + MH9h + v[24] + v[25] + v[28]
    MH = ((MHsum - 5)/ 25) * 100

    if version == :v1
        PCS, MCS = scorev1([PF, RP, BP, GH, VT, SF, RE, MH])
    elseif version == :v2
        PCS, MCS = scorev2([PF, RP, BP, GH, VT, SF, RE, MH])
    else
        error("Unknown version!")
    end

    SF36Result(
    PCS,
    MCS,
    PF,
    RP,
    BP,
    GH,
    VT,
    SF,
    RE,
    MH)
end #sf36(v) end


const sf12pwdict = Dict(:PF02 => [-7.23216, -3.45555, 0], :PF04 => [-6.24397, -2.73557, 0], :RP2 => [-4.61617, 0], 
:RP3 => [-5.51747, 0], :BP2 => [-11.25544, -8.38063, -6.50522, -3.80130, 0], :GH1 => [-8.37399, -5.56461, -3.02396, -1.31872, 0],
:VT2 => [-2.44706, -2.02168, -1.6185, -1.14387, -0.42251, 0], :SF2 => [-0.33682, -0.94342, -0.18043, 0.11038, 0], #:SF2 => [-0.33682, -0.94342, -0.56193, -0.18043, 0],
:RE2 => [3.04365, 0], :RE3 => [2.32091, 0], :MH3 => [3.46638, 2.90426, 2.37241, 1.36689, 0.66514, 0], 
:MH4 => [4.61446, 3.41593, 2.34247, 1.28044, 0.41188, 0])

const sf12mwdict = Dict(:PF02 => [3.93115, 1.8684, 0], :PF04 => [2.68282, 1.43103, 0], :RP2 => [1.4406, 0], 
:RP3 => [1.66968, 0], :BP2 => [1.48619, 1.7669, 1.49384, 0.90384, 0], :GH1 => [-1.71175, -0.16891, 0.03482, -0.06064, 0],
:VT2 => [-6.02409, -4.88962, -3.29805, -1.65178, -0.92057, 0], :SF2 => [-6.29724, -8.26066, -5.63286, -3.13896,  0], #:SF2 => [-6.29724, -8.26066, -6.94676, -5.63286, 0],
:RE2 => [-6.82672, 0], :RE3 => [-5.69921, 0], :MH3 => [-10.19085, -7.92717, -6.31121, -4.09842, -1.94949, 0], 
:MH4 => [-16.15395, -10.77911, -8.09914, -4.59055, -1.95934, 0])

#=
1 - GH1 
2 - PF02
3 - PF04
4 - RP2
5 - RP3
6 - RE2
7 - RE3
8 - BP2
9 - MH3
10 - VT2
11 - MH4
12 - SF2
=#

"""
    sf12(v; version = :v1)

Calculate SF12 results for vector of answers `v`:

1 - GH1 

2 - PF02

3 - PF04

4 - RP2

5 - RP3

6 - RE2

7 - RE3

8 - BP2

9 - MH3

10 - VT2

11 - MH4

12 - SF2


Reference:

Ware Jr, John E., Mark Kosinski, and Susan D. Keller. "A 12-Item Short-Form Health Survey: construction of scales and preliminary tests of reliability and validity." Medical care 34.3 (1996): 220-233.Validation Literature:

Gandek, Barbara, et al. "Cross-validation of item selection and scoring for the SF-12 Health Survey in nine countries: results from the IQOLA Project." Journal of clinical epidemiology51.11 (1998): 1171-1178.
Jenkinson, Crispin, et al. "A shorter form health survey: can the SF-12 replicate results from the SF-36 in longitudinal studies?." Journal of Public Health 19.2 (1997): 179-186.Additional Literature:

Ware, John E., Susan D. Keller, and Mark Kosinski. SF-12: How to score the SF-12 physical and mental health summary scales. Health Institute, New England Medical Center, 1995.

See also: https://orthotoolkit.com/sf-12/

https://www.researchgate.net/profile/John-Ware-6/publication/291994160_How_to_score_SF-12_items/links/58dfc42f92851c369548e04e/How-to-score-SF-12-items.pdf

"""
function sf12(v)

    if length(v) != 12 error("Length is not 12!") end
    
    PF02 = (sf12pwdict[:PF02][v[2]], sf12mwdict[:PF02][v[2]]) #
    PF04 = (sf12pwdict[:PF04][v[3]], sf12mwdict[:PF04][v[3]]) #
    RP2 = (sf12pwdict[:RP2][v[4]], sf12mwdict[:RP2][v[4]]) #
    RP3 = (sf12pwdict[:RP3][v[5]], sf12mwdict[:RP3][v[5]]) #
    BP2 = (sf12pwdict[:BP2][6 - v[8]], sf12mwdict[:BP2][6 - v[8]]) #
    GH1 = (sf12pwdict[:GH1][6 - v[1]], sf12mwdict[:GH1][6 - v[1]]) #
    VT2 = (sf12pwdict[:VT2][7 - v[10]], sf12mwdict[:VT2][7 - v[10]]) #
    SF2 = (sf12pwdict[:SF2][v[12]], sf12mwdict[:SF2][v[12]])
    RE2 = (sf12pwdict[:RE2][v[6]], sf12mwdict[:RE2][v[6]]) #
    RE3 = (sf12pwdict[:RE3][v[7]], sf12mwdict[:RE3][v[7]]) #
    MH3 = (sf12pwdict[:MH3][7 - v[9]], sf12mwdict[:MH3][7 - v[9]])
    MH4 = (sf12pwdict[:MH4][v[11]], sf12mwdict[:MH4][v[11]])

    PCS = PF02[1] + PF04[1] + RP2[1] + RP3[1] + BP2[1] + GH1[1] + VT2[1] + SF2[1] + RE2[1] + RE3[1] + MH3[1] + MH4[1]
    MCS = PF02[2] + PF04[2] + RP2[2] + RP3[2] + BP2[2] + GH1[2] + VT2[2] + SF2[2] + RE2[2] + RE3[2] + MH3[2] + MH4[2]

    SF12Result(PCS + 56.57706, MCS + 60.75781)
end



function Base.show(io::IO, sf::SF36Result)
    println(io, "Physical Functioning (PF)      ", round(sf.PF, digits = 2))
    println(io, "Role-Physical Functioning (RP) ", round(sf.RP, digits = 2))
    println(io, "Bodily pain (BP)               ", round(sf.BP, digits = 2))
    println(io, "General Health (GH)            ", round(sf.GH, digits = 2))
    println(io, "Vitality (VT)                  ", round(sf.VT, digits = 2))
    println(io, "Social Functioning (SF)        ", round(sf.SF, digits = 2))
    println(io, "Role Emotional (RE)            ", round(sf.RE, digits = 2))
    println(io, "Mental Health (MH)             ", round(sf.MH, digits = 2))
    println(io, "-------------------------------")
    println(io, "Physical health (PCS)          ", round(sf.PCS, digits = 4))
    println(io, "Mental Health (MCS)            ", round(sf.MCS, digits = 4))
end

function Base.show(io::IO, sf::SF12Result)
    println(io, "Physical health (PCS)          ", round(sf.PCS, digits = 4))
    println(io, "Mental Health (MCS)            ", round(sf.MCS, digits = 4))
end



end
