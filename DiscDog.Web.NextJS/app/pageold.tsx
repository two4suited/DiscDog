import { API_URL } from "./lib/constants";

interface WeatherData {
  date: string;
  temperatureC: number;
  temperatureF: number;
  summary: string;
}



async function getData() {
 
  //const res = await fetch(`${API_URL}/weatherforecast`)
  const res = await fetch(`${API_URL}/weatherforecast`,{ cache: 'no-store' })  
  const weatherData: WeatherData[] = await res.json();
 
  if (!res.ok) {
    // This will activate the closest `error.js` Error Boundary
    throw new Error('Failed to fetch data')
  }

  return weatherData
}


export default async function Home() {
 
  const data = await getData();  
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
    <table className="table-auto border-collapse border border-green-800">
   <thead>
     <tr>
       <th className="border border-green-600 px-4 py-2 text-green-700">Date</th>
       <th className="border border-green-600 px-4 py-2 text-green-700">Temperature (C)</th>
       <th className="border border-green-600 px-4 py-2 text-green-700">Temperature (F)</th>
       <th className="border border-green-600 px-4 py-2 text-green-700">Summary</th>
     </tr>
   </thead>
   <tbody>
     {data.map((data, index) => (
       <tr key={index} className="bg-green-100">
         <td className="border border-green-500 px-4 py-2 text-green-600">{data.date}</td>
         <td className="border border-green-500 px-4 py-2 text-green-600">{data.temperatureC}</td>
         <td className="border border-green-500 px-4 py-2 text-green-600">{data.temperatureF}</td>
         <td className="border border-green-500 px-4 py-2 text-green-600">{data.summary}</td>
       </tr>
     ))}
   </tbody>
 </table>
  </main>
  );
}
