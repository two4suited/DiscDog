import { getTeams } from "@/app/lib/club/teams/data";


export default async function TeamList() {
    const teams = await getTeams();
    return (
        <table className="table-auto border-collapse border border-blue-800">
          <thead>
            <tr>
              <th className="border border-blue-600 px-4 py-2 text-blue-700">Person</th>
              <th className="border border-blue-600 px-4 py-2 text-blue-700">Dog</th>
            </tr>
          </thead>
          <tbody>
            {teams.map((team, index) => (
              <tr key={index} className={index % 2 === 0 ? 'bg-blue-100' : 'bg-white'}>
                <td className="border border-blue-500 px-4 py-2 text-blue-600">{team.person}</td>
                <td className="border border-blue-500 px-4 py-2 text-blue-600">{team.dog}</td>
              </tr>
            ))}
          </tbody>
        </table>
      );
}