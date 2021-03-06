class Gip #< ActiveRecord::Base

GIP_LIST = %w{ ABY0111 ADD0111 ADD0661 ALB0331 ALB1101 APS0111 ARA2201 ARG1101 ARI0501 ARI1101 ARI1102 ASB0331 ASB0661 ASY0111 ATI0111 ATI2201 ATU1101 AVI2201 BAL0331 BDE0111 BEN0161 BEN0162 BEN0163 BEN2201 BEN2202 BLN0331 BOB0331 BOB1101 BPD1101 BPE0331 BPE0551 BPE2201 BPT1101 BRB0331 BRK0331 BRY0111 BRY0661 BWK1101 BWR0111 CBE0331 CBG0111 CLH0111 CML0331 COB0661 COL0111 COL0661 CPK0111 CPK0331 CST0331 CUL0331 CUL0661 CYD0331 CYD2201 DAR0111 DOB0331 DOB0661 DVK0111 EDG0331 EDN0331 FHL0331 FKN0331 GFD0331 GIS0111 GIS0501 GLN0331 GLN0332 GOR0331 GYM0661 GYT0331 HAM0111 HAM0331 HAM0551 HAM2201 HAY0111 HAY0331 HAY1101 HAY2201 HBK0661 HEN0331 HEN2201 HEP0331 HIN0331 HKK0661 HLY0331 HLY2201 HOB1101 HOR0331 HOR0661 HTI0331 HUI0331 HWA0331 HWA0332 HWA1101 HWA1102 HWB0331 HWB0332 HWB1101 HWB2201 INV0331 INV2201 INV2202 ISL0331 ISL0661 ISL2201 KAI0111 KAW0111 KAW0112 KAW0113 KAW1101 KAW2201 KBY0661 KBY0662 KEN0331 KIK0111 KIN0111 KIN0112 KIN0113 KIN0331 KKA0331 KMO0331 KOE0331 KOE1101 KPA1101 KPO1101 KPU0661 KTA0331 KUM0661 KWA0111 LFD1101 LFD1102 LTN0331 MAN2201 MAT1101 MAT1102 MCH0111 MDN0141 MDN0331 MDN1101 MDN2201 MER0331 MER1101 MGM0331 MHO0331 MKE1101 MLG0111 MLG0331 MLN0661 MLN0664 MNG0331 MNG1101 MNI0111 MNO0111 MOT0111 MPE0331 MPE1101 MPI0331 MPI0661 MRA0111 MRR0111 MST0331 MTI0111 MTI2201 MTM0111 MTM0331 MTN0331 MTO0331 MTR0331 NAP2201 NAP2202 NMA0331 NPK0331 NPL0331 NPL1101 NPL2201 NSY0331 OAM0331 OHA2201 OHB2201 OHC2201 OHK2201 OKI0111 OKI2201 OKN0111 ONG0331 OPK0331 ORO1101 ORO1102 OTA0221 OTA1101 OTA1102 OTA2201 OTA2202 OTI0111 OWH0111 PAK0331 PAL0331 PAO1101 PAP0111 PAP0661 PEN0221 PEN0251 PEN0331 PEN1101 PNI0331 PPI2201 PRM0331 RDF0331 RDF2201 RFN1101 RFN1102 RFT0111 ROS0221 ROS1101 ROT0111 ROT0331 ROT1101 ROX1101 ROX2201 RPO2201 SBK0331 SDN0331 SFD0331 SFD2201 SPN0331 SPN0661 STK0331 STK0661 STK2201 STU0111 SVL0331 SWN0251 SWN2201 TAK0331 TGA0111 TGA0331 THI2201 TIM0111 TKA0111 TKA0331 TKB2201 TKH0111 TKR0331 TKU0331 TKU2201 TMI0331 TMK0111 TMK0331 TMN0551 TMN2201 TMU0111 TMU1101 TNG0111 TNG0551 TNG2201 TOB0501 TRK0111 TRK2201 TUI0111 TUI1101 TWC2201 TWH0331 TWI2201 TWZ0331 UHT0331 WAI0111 WDV0111 WDV1101 WEL0331 WES0331 WGN0331 WHI0111 WHI2201 WHU0331 WIL0331 WIR0331 WKM2201 WKO0331 WKU2201 WPA2201 WPR0331 WPR0661 WPT0111 WPW0331 WRA0111 WRA0501 WRD0331 WRK0331 WRK2201 WTK0111 WTK0331 WTK2201 WTN0661 WTU0331 WVY0111 WWD1102 WWD1103 }

  def initialize(this_gip)
    throw "#{this_gip} is not in the GIP list" unless GIP_LIST.include?(this_gip)
    @gip = this_gip
  end

  def price_for_date(date = Date.today)
    prices[date]
  end

  private

  def gip=(val)
    @gip = val
  end
  def gip
    @gip
  end


  def prices
    @prices ||= Hash.new do |prices, date| 
      response = HTTParty.get "http://www.electricityinfo.co.nz/comitFta/five_min_prices.download?INchoice=SEL&INdate=#{date.strftime('%d/%m')}/#{date.year}&INgip=#{gip}&INperiodfrom=1&INperiodto=50&INtype=Average"
      csv = response.body.gsub(/\r/,"")
      fields = nil
      price_data = []
      CSV.parse(csv) do |row|
        if row.first == "Grid Point"
          fields = row
        else
          price_data << fields.zip(row).to_h
        end
      end
      prices[date] = price_data.map{|p| format_prices!(p) }
    end
    @prices
  end


  def format_prices!(prices)
    fields_types = { 
      "Grid Point"=> :to_s,
      "Trading Date"=> :to_date,
      "Trading Period"=> :to_i,
      "Market Time"=> :to_time,
      "Average Price"=> :to_f,
      "Island"=> :to_s,
      "Area"=> :to_s,
      "Input Count"=> :to_i
    }

    prices["Market Time"] = "#{prices["Trading Date"]} #{prices["Market Time"]}"

    prices.each do |key, val|
      prices[key] = val.send fields_types[key]
    end
  end


end