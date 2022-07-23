interface ButtonProps {
  onClick: () => void;
  children: JSX.Element | JSX.Element[] | string | string[];
  className?: string;
}

export default function Button({ onClick, children, className }: ButtonProps) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={`relative inline-flex items-center px-4 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:z-10 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 ${className}`}
    >
      {children}
    </button>
  );
}