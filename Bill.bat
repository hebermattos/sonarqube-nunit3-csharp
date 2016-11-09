attrib -r "C:\Builds\7\Bill\CI_Bill\src\Bill\*.*" /s

cd C:\Builds\7\Bill\CI_Bill\src\Bill

MSBuild.SonarQube.Runner.exe begin /version:1.0 /name:"Bill" /key:"Bill" /d:sonar.cs.opencover.reportsPaths="C:\BillTestResults\opencover.xml" /d:sonar.cs.nunit.reportsPaths="C:\BillTestResults\NUnitResults.xml" 

"c:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild" bill.sln

"C:\Builds\7\Bill\CI_Bill\src\Bill\packages\opencover.4.6.519\OpenCover.Console.exe" -register:user -target:"C:\Builds\7\Bill\CI_Bill\src\Bill\packages\NUnit.ConsoleRunner.3.5.0\tools\nunit3-console.exe" -targetargs:"-result:\BillTestResults\NUnitResults.xml;format=nunit2 C:\Builds\7\Bill\CI_Bill\src\Bill\test\RedeHost.Bill.Domain.Test\bin\Debug\RedeHost.Bill.Domain.Test.dll" -filter:"+[RedeHost.Bill.Domain]*" -output:"C:\BillTestResults\opencover.xml" 

MSBuild.SonarQube.Runner.exe end
