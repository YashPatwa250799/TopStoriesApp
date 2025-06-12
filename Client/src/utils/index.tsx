export const formatDate = (dateString: string | null | undefined): string => {
  if (!dateString) return "N/A";
  return new Date(dateString).toLocaleDateString("en-US", {
    year: "numeric",
    month: "short",
    day: "numeric",
    hour: "2-digit",
    minute: "2-digit",
  });
};

export const renderFacets = (
  facets?: string[],
  icon?: React.ReactNode,
  title?: string,
  color?: string
) => {
  if (!facets || facets.length === 0 || !color) return null;

  return (
    <div className="mb-4">
      <div className={`flex items-center gap-2 mb-2 text-${color}-600`}>
        {icon}
        <span className="font-semibold text-sm">{title}</span>
      </div>
      <div className="flex flex-wrap gap-1">
        {facets.map((facet, index) => (
          <span
            key={index}
            className={`px-2 py-1 bg-${color}-100 text-${color}-800 rounded-full text-xs`}
          >
            {facet}
          </span>
        ))}
      </div>
    </div>
  );
};
